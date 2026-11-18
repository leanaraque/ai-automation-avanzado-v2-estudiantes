# La entrega final, requisito por requisito

La entrega final (Módulo 11) no pide nada que no hayas construido en el curso: pide juntarlo en un solo sistema y documentarlo. Esta guía dice qué pide cada requisito y en qué clase lo hiciste.

Se entrega un solo PDF: `Apellido_Nombre_ProyectoFinal_AI_Experto.pdf` (el DMSA, "Documentación Maestra del Sistema Agéntico"). Opcional: un video público de hasta 3 minutos con el sistema funcionando.

## Parte A · El sistema en n8n

| Requisito | Qué significa | Dónde lo hiciste |
|---|---|---|
| Petición asincrónica | Recibe el pedido, contesta "recibido" al instante y procesa en segundo plano | **Webhook** con **Respond: Immediately** (es la opción por defecto), o el **Chat Trigger** |
| Arquitectura Manager-Worker | Un flujo que coordina y sub-workflows especialistas; nada de un flujo gigante | Clase 2: `roble-manager` y sus workers |
| Respuestas solo con tu base de conocimiento | Cita la fuente y dice "No sé" cuando la información no está | Clase 5 (RAG con Supabase) y el "No tengo ese dato. Te paso con Julián" de la Clase 8 |
| El juez antes de actuar | La respuesta pasa obligatoriamente por el supervisor (AI-as-a-Judge) antes de registrar datos o responder. Si la exactitud es menor a 4, va a una persona | Clase 8: `Roble - Juez`, el Switch y la aprobación por Telegram |
| Notificación por un canal externo | El resultado validado sale por Slack, Telegram o Gmail | Clase 4 (Gmail y Slack), Clases 6 y 8 (Telegram) |
| Memoria de largo plazo | Recuerda al cliente entre conversaciones | Clase 3 (Google Sheets) |
| Reintentos sin duplicar | Si algo falla y se reintenta, no se crea dos veces el mismo registro ni se manda dos veces el mismo mensaje | Clase 4 (buscar en HubSpot antes de crear) y los reintentos de la Clase 8 |
| Ramas de error | Si se cae una API externa, el sistema avisa al equipo | En cada nodo externo: **Settings** > **On Error** > **Continue (using error output)**, y conectá esa salida a un aviso por Telegram o Slack |
| Trazabilidad (recomendado) | Un identificador que une todo lo que pasó en una conversación | Clase 9: el `traceId` en cada sub-workflow |

## Parte B · El DMSA (el PDF)

| Sección | Qué va | De dónde lo sacás |
|---|---|---|
| 1. Portada y resumen ejecutivo | Título, tu nombre, cohorte (2026) y el problema de negocio que resolvés | El problema y la promesa del brochure de la Clase 10 |
| 2. Arquitectura | Capturas nítidas del lienzo de n8n: los sub-workflows, cómo pasan los datos, la memoria y la base de conocimiento | Tus flujos. Acá **sí** van capturas: este documento lo lee alguien técnico |
| 3. Auditoría | 3 ejemplos reales de respuestas evaluadas por el juez, con su JSON (`exactitud_factual`, `estado_veredicto`, `errores`, `justificacion`) | **Executions** de `Roble - Juez`: abrí una ejecución, nodo `Veredicto`, vista **JSON** |
| 4. Justificación financiera | Costo mensual en tokens contra el costo de la persona que hoy hace la tarea | El tablero de la Clase 8 (costo real por 1.000 consultas) y el business case de la Clase 10 |

El material sugiere modelos económicos como GPT-4o-mini o Claude 3 Haiku, que ya no existen. Con Groq, el económico es `openai/gpt-oss-20b`.

## Cómo se evalúa

| Criterio | Peso |
|---|---|
| Consolidación técnica: asincrónico, segundo plano, notificación y el juez bloqueando lo riesgoso | 35% |
| Estructura y calidad del documento | 25% |
| Arquitectura, integración y persistencia de datos | 20% |
| Reporte de auditoría y control de calidad | 12% |
| Justificación financiera | 8% |

Aprobación: 70 de 100 puntos. La rúbrica tiene un sexto criterio (profesionalismo de la defensa) que figura con 0%.

## Qué evitar

- Pegar una API key o un token en un prompt, en un texto o en el PDF. Van siempre en **Credentials**. En el documento describí las variables y las tablas, nunca las claves.
- Un sistema sin ramas de error: si se cae una API externa, alguien del equipo se tiene que enterar.
- Hablarle al comité con lenguaje de nodos. En el resumen ejecutivo y en el ROI, tiempo, riesgo y dinero.

## Brochure (Módulo 10) o DMSA (Módulo 11)

| | Brochure (pre-entrega 10) | DMSA (entrega final) |
|---|---|---|
| Lo lee | Un comité de negocio | Alguien técnico (un gerente de IT) y la dirección |
| Capturas de n8n | No | Sí |
| Jerga técnica | No | Sí, en la arquitectura; no en el resumen ni en el ROI |
| Foco | Por qué conviene y cómo se cobra | Cómo está construido y que funciona |
