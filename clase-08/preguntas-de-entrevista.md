# Medir y vender un agente: preguntas de entrevista

Lo que vimos en la Clase 8, ordenado como preguntas que aparecen en entrevistas para puestos de automatización con IA. Los ejemplos son del caso Muebles Roble.

## ¿Cómo sabés que tu agente funciona?

Lo mido en cuatro capas:

| Capa | Qué miro | En Muebles Roble |
|---|---|---|
| Calidad | Casos de oro (preguntas con su respuesta correcta) y métricas de RAGAS | 5 casos, cada uno en dos arquitecturas (A y B) |
| Seguridad | Un juez que revisa cada respuesta y reglas programadas | El Switch manda al equipo los reembolsos, abogados y manipulaciones |
| Operación | HITL rate (cuántas respuestas pasan por una persona), costo por ejecución, segundos | Medio dólar cada 1.000 consultas |
| Negocio | Ahorro, ROI y payback contra la línea de base | Julián: 3 horas por día en 42 consultas repetidas |

"Lo probé y anda" es un solo caso. "Procesó 1.000 mensajes" es volumen, no calidad.

## ¿Qué mide RAGAS?

Separa dos culpables: el buscador (lo que trae el RAG) y el modelo (lo que responde con eso). Todas van de 0 a 1.

| Métrica | Pregunta | Cómo se calcula | Si da baja, la culpa es de |
|---|---|---|---|
| Fidelidad (faithfulness) | ¿Lo que dice la respuesta está en el contexto? | Afirmaciones sustentadas / afirmaciones de la respuesta | El modelo: inventa |
| Relevancia de la respuesta (answer relevancy) | ¿Responde lo que se preguntó? | Genera preguntas desde la respuesta y las compara con la original | El modelo: se va por las ramas |
| Precisión del contexto (context precision) | ¿Los fragmentos útiles llegaron primero? | Promedio de la precisión en cada posición útil | El buscador: ordena mal |
| Recall del contexto (context recall) | ¿El contexto tenía todo lo necesario? | Afirmaciones de la respuesta correcta que estaban en el contexto / total | El buscador: no lo encontró |

## Las respuestas son fieles pero incorrectas. ¿Qué mirás?

El recall del contexto. Si el buscador no trajo el fragmento, el modelo no puede responder bien aunque no invente nada. En la clase, para "¿cuánto tarda una biblioteca a medida?" el buscador trajo "cuidado de la madera" y "garantía": recall 0, y el agente respondió "No tengo ese dato". Se arregla en la recuperación (fragmentos, metadatos), no en el prompt.

Y al revés: una respuesta puede ser fiel (todo lo que dice está en el manual) e incompleta. "El envío a Palermo cuesta 18.000 pesos" es fiel, pero le falta que es gratis desde 400.000. Por eso además de RAGAS se compara contra la respuesta de referencia.

## ¿Cómo evitás que el juez se equivoque?

- Un modelo distinto (y más grande) que el que responde: no se califica a sí mismo.
- Temperatura 0 y salida JSON con un esquema fijo.
- Lo que se puede verificar con código (montos, plazos, largo) lo verifica el código, no el juez.
- Al juez también se lo mide: se compara su veredicto con la verdad en una muestra revisada por personas. En la clase acertó el 80%.
- Lo riesgoso no depende del juez: se programa (el juez aceptó un pedido de reembolso; la regla del Switch lo mandó igual al equipo).

## ¿Cómo justificás el costo ante el cliente?

1. Costo por ejecución con los tokens reales que informa el proveedor (incluidos los de razonamiento, que no se ven en la respuesta). En la clase, el juez gastaba casi 4 veces más tokens que el agente.
2. Proyectado a 1.000 ejecuciones y al volumen del mes.
3. Contra el ahorro sobre la línea de base, descontando lo que igual pasa por una persona (HITL rate).
4. Con eso sale el payback: implementación / ahorro neto por mes.

## ¿LangSmith o Langfuse?

| | LangSmith | Langfuse |
|---|---|---|
| Qué es | Plataforma de LangChain para trazas, datasets, experimentos y evaluadores | Plataforma de código abierto para trazas, costos, puntajes y prompts |
| Plan gratuito (noviembre de 2026) | 5.000 trazas por mes, 1 usuario | 50.000 unidades por mes, 2 usuarios |
| Con n8n | Solo con n8n instalado en un servidor propio (variables de entorno); no en n8n Cloud | Sin integración nativa: por API, un nodo de la comunidad o OpenTelemetry |

Los conceptos son los mismos que usamos en n8n: dataset = casos de oro; experimento = una corrida de A o de B; evaluador = el juez y la verificación por código; traza = cada ejecución. Evaluación *offline* es la que se hace antes de publicar, con casos de oro; *online*, la que corre sobre cada mensaje real (el juez del flujo de atención).
