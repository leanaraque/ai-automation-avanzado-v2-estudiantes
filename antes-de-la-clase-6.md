# Antes de la Clase 6 (lunes 2/11)

En la Clase 6 el bot de Telegram de Muebles Roble escucha notas de voz y responde con audio. La clase dura **50 minutos**, así que conviene llegar con todo listo. Si te falta algo, seguí la clase mirando y completalo después: la pre-entrega es un PDF con capturas.

| Qué | Para qué | Tiempo |
|---|---|---|
| 1. n8n **Cloud** | Telegram necesita una dirección pública para avisarle a n8n | 0 a 5 min |
| 2. Tu clave de Groq | Whisper (pasa la voz a texto) y el modelo que responde | 0 min |
| 3. Un bot de Telegram | El canal por donde llegan y salen los audios | 5 min |
| 4. Una cuenta gratuita de ElevenLabs | La voz del bot | 5 min |
| 5. El nodo de ElevenLabs instalado en n8n | Para poder importar el flujo | 2 min |

## 1. n8n Cloud

Usá n8n Cloud (la de la Clase 4 o una prueba nueva en [app.n8n.cloud/register](https://app.n8n.cloud/register)). En n8n local, Telegram no puede avisarle a tu computadora que llegó un mensaje sin configurar un túnel: no lo vemos en clase.

## 2. Tu clave de Groq

La de la Clase 2 (empieza con `gsk_`). Si ya está guardada como credencial en n8n, no tenés que hacer nada.

## 3. Tu bot de Telegram

1. Instalá Telegram en el celular y, si podés, Telegram Desktop en la computadora (o usá [web.telegram.org](https://web.telegram.org)).
2. Buscá **@BotFather** (con la tilde azul de verificado) y escribile `/newbot`.
3. Nombre: `Muebles Roble` (o el de tu negocio). Usuario: uno que termine en `bot` y no exista (por ejemplo, `roble_` + tus iniciales + `_bot`).
4. BotFather te da un **token** (una línea como `123456789:AA...`). Guardalo en un archivo de texto: es la llave de tu bot, no la compartas.
5. Abrí el chat de tu bot (el enlace `t.me/...`) y tocá **Iniciar**.

## 4. Tu cuenta de ElevenLabs

1. Creá la cuenta en [elevenlabs.io/app/sign-up](https://elevenlabs.io/app/sign-up), plan **Free** (trae unos 10.000 caracteres por mes).
2. Abajo a la izquierda, tu perfil > **API Keys** > **Create API Key**. Nombre `n8n`. En los permisos, habilitá **Text to Speech** y la lectura de **Voices**.
3. Copiá la clave y guardala en un archivo de texto.

## 5. El nodo de ElevenLabs en n8n

1. En n8n, abrí un workflow vacío (**Create workflow**), hacé clic en **+** (arriba a la derecha) y buscá `ElevenLabs`.
2. Elegí **ElevenLabs** (el verificado, *by ElevenLabs*) y hacé clic en **Install node**.

## Comprobación

- [ ] Entro a **n8n Cloud** y al buscar `ElevenLabs` en el **+** aparece el nodo instalado.
- [ ] Tengo el token de mi bot y le toqué **Iniciar** en Telegram.
- [ ] Tengo mi clave de ElevenLabs guardada.
- [ ] Mi credencial de Groq está en n8n (**Overview** > **Credentials**).
