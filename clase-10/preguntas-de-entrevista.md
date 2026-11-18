# Vender y desplegar un agente: preguntas de entrevista

Lo que vimos en la Clase 10, ordenado como preguntas que aparecen en entrevistas para puestos de automatización con IA y de consultoría. Los ejemplos son del caso Muebles Roble.

## ¿Cómo cobrarías un proyecto con agentes de IA?

Con un modelo híbrido de tres partes:

| Parte | Qué cubre | En Muebles Roble |
|---|---|---|
| Implementación (una vez) | La auditoría del proceso y la línea de base, la configuración y las pruebas | US$ 900 |
| Soporte mensual | Re-medir la calidad cada mes, actualizar la base de conocimiento, ajustar el agente, cambiar de modelo si conviene | US$ 120 por mes |
| Por resultado | Un porcentaje de un resultado atribuible y auditable | 4% de cada presupuesto grande que el sistema registró y que se cerró dentro de 30 días |

Nunca 100% por resultado: las APIs externas (Application Programming Interfaces: las conexiones con servicios como Groq o HubSpot) y los datos del cliente no los controlás. El soporte cubre, como mínimo, tu costo.

Por qué no los modelos de siempre: el precio fijo se rompe con cada caso raro que aparece en producción; cobrar por hora castiga al que trabaja rápido; y el soporte solo cuando algo se rompe hace que el cliente vea la IA como algo inestable.

## Si cobrás por resultado, ¿qué tiene que decir el contrato?

- **El KPI (Key Performance Indicator: el indicador clave que se mide) atribuible:** qué cuenta exactamente. Por ejemplo, "presupuesto registrado por el sistema en HubSpot con Origen = Asistente que se cerró como venta".
- **La ventana de conversión, en días:** si el cliente compra seis meses después, ¿cuenta? Se fija un plazo (por ejemplo, 30 días).
- **La única fuente de verdad:** los registros del sistema: los logs, el `traceId` (el número de seguimiento de cada conversación) y el campo de origen en el CRM (Customer Relationship Management: el sistema donde se registran los clientes, como HubSpot). Así nadie "juega" con la métrica.

## ¿Cómo le explicás un agente a un directivo que no es técnico?

- Como un **rol**, no como una tecnología: "un analista virtual que conoce el manual, sigue las reglas de la empresa y sabe cuándo pasarle el caso a una persona".
- Respondiendo sus tres preguntas: **impacto** (cuánto ahorra o genera), **riesgo** (qué puede salir mal y qué tan grave es) y **control** (quién tiene la mano en el freno).
- Mostrando el **resultado** (la respuesta que le llega al cliente, el registro en el CRM), no el editor de n8n.
- Con el molde **Función > Beneficio**: "Agente con RAG" (Retrieval-Augmented Generation: busca en los documentos antes de responder) se dice "responde en segundos con las políticas vigentes y, si algo no está en el manual, no lo inventa".

## ¿Cómo lo ponés en producción sin romper nada?

Por fases, cada una con un criterio medible para pasar a la siguiente:

| Fase | Qué puede hacer el agente | Para pasar a la siguiente (Roble) |
|---|---|---|
| 0 · Modo sombra | Propone respuestas que no le llegan al cliente; una persona las valida | 50 consultas reales con 90% de respuestas correctas |
| 1 · Solo lectura | Responde preguntas frecuentes; no registra ni cambia datos | 4 semanas con menos del 20% derivado a una persona |
| 2 · Escritura controlada | Registra datos con la aprobación de una persona | 95% de aprobaciones sin cambios |
| 3 · Autonomía supervisada | Actúa dentro de las reglas; un juez audita | Si la precisión baja, vuelve a la Fase 2 |

Y un plan si falla: si el modelo no responde o tarda, la consulta va a una persona; nunca se pierde ni se responde dos veces.

## ¿Qué pasa si el proveedor cambia el modelo y tu agente empeora?

Es la **deriva** del modelo. El soporte mensual incluye re-medir con los casos de oro cada mes y adaptar el agente a los cambios del proveedor, y eso queda escrito en el contrato.

## ¿Cómo demostrás el ROI (Return on Investment: el retorno de la inversión)?

- Con una **línea de base** medida antes de encender el agente (cuánto tarda y cuánto cuesta hoy). Esa auditoría es la primera fase, y se cobra.
- Con el **costo total**, incluido tu soporte. En Roble, el payback pasa de 4 meses (sin soporte) a 5,2 meses (con soporte de US$ 120): si no lo ponés en la cuenta, el cliente se entera después.
- Con dos escenarios, y el **conservador primero**. En Roble: solo con las horas de Julián se paga en 5,2 meses; si además se recupera un presupuesto grande por mes, en 1,6 meses.

## Tres objeciones de comité, con su respuesta

| Objeción | Respuesta (con un dato concreto) |
|---|---|
| "Esto ya lo hace nuestro CRM." | El CRM guarda los datos, pero no contesta: hoy Julián copia y pega. El asistente responde las 924 consultas repetidas por mes y registra en el CRM los presupuestos que hoy se pierden en el correo |
| "¿Y si el agente se equivoca o borra datos?" | En las primeras fases no puede escribir sin que una persona apruebe. Un revisor controla cada respuesta antes de que salga, y los reembolsos siempre los decide una persona. Si la precisión baja del 90%, vuelve a la fase anterior |
| "Es caro para lo que ahorra." | En el escenario conservador quedan US$ 172 netos por mes y se paga en 5,2 meses. La parte por resultado solo se cobra si el sistema recupera ventas: ese riesgo lo asume el consultor |
