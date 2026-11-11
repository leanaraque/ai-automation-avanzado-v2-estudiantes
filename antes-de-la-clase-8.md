# Antes de la Clase 8 (miércoles 11/11)

En la Clase 8 medimos el agente de Muebles Roble con casos de oro y métricas de RAGAS, lo protegemos con un juez y aprendemos a vendérselo al cliente con números. Los tres flujos se importan completos: no hay que armar nodos.

| Qué | Para qué | Tiempo |
|---|---|---|
| 1. n8n **Cloud** con tu credencial de Groq | Correr la medición y el juez | 0 a 5 min |
| 2. Un bot de Telegram para el "equipo" y tu Chat ID | Que n8n te pida aprobar una respuesta y espere tu decisión. En clase lo muestra el profesor; vos lo usás en la pre-entrega | 5 min |

## 1. n8n Cloud y Groq

Usá la cuenta de n8n Cloud de las clases anteriores (o una prueba nueva en [app.n8n.cloud/register](https://app.n8n.cloud/register)) con tu credencial de Groq (**Overview** > **Credentials**). Si no la tenés, creala con una clave de [console.groq.com/keys](https://console.groq.com/keys).

El plan gratuito de Groq permite 8.000 tokens por minuto por modelo. La medición de la clase usa casi todo ese límite: si ves `too many requests`, esperá un minuto y volvé a ejecutar.

## 2. El bot del equipo y tu Chat ID

Podés usar el bot de la Clase 6 o crear uno nuevo con **@BotFather** (`/newbot`). Guardá el token en un archivo de texto.

1. Abrí el chat de tu bot, tocá **Iniciar** y escribile `hola`.
2. En el navegador, abrí esta dirección reemplazando `TOKEN` por el token de tu bot:

   ```text
   https://api.telegram.org/botTOKEN/getUpdates
   ```

3. Buscá `"chat":{"id":` y copiá el número que sigue. Es tu **Chat ID**: guardalo junto al token.

Si ves `{"ok":true,"result":[]}`, mandale otro `hola` al bot y recargá. Si ves un error que habla de `webhook`, el bot está conectado a un flujo publicado de la Clase 6: despublicalo en n8n o creá un bot nuevo.

## Comprobación

- [ ] Entro a **n8n Cloud** y veo mi credencial de Groq en **Credentials**.
- [ ] Tengo el token de mi bot y mi Chat ID guardados.

Después de la clase: las preguntas de entrevista con sus respuestas están en [`clase-08/preguntas-de-entrevista.md`](clase-08/preguntas-de-entrevista.md).
