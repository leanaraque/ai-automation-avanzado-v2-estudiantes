# Antes de la Clase 4 (lunes 26/10)

En la Clase 4 conectamos la casilla de soporte de Muebles Roble con tres herramientas reales: **Gmail** (lee cada correo y deja la respuesta como borrador), **HubSpot** (el CRM, donde queda cada cliente) y **Slack** (el aviso al equipo). Necesitás cinco cosas. Si te falta alguna, completala en el break de la clase y, hasta entonces, seguí mirando.

| Qué | Para qué | Tiempo |
|---|---|---|
| 1. n8n **Cloud** | Gmail y HubSpot se conectan con un clic | 5 min |
| 2. Tu clave de Groq | El modelo que redacta la respuesta (la de la Clase 2) | 0 min |
| 3. Slack con el canal `#operaciones` | El aviso al equipo (el de la Clase 2) | 0 min |
| 4. Una cuenta gratuita de HubSpot | El CRM | 10 min |
| 5. Dos casillas de correo | Una se conecta a n8n (la "casilla de soporte"); desde la otra le escribís como si fueras cliente | 0 min |

## 1. n8n Cloud (aunque uses n8n local)

**Para esta clase usá n8n Cloud.** En n8n Cloud, Gmail y HubSpot se conectan con un botón ("Sign in with Google" y "Connect my account"). En n8n local, cada una exige crear una aplicación propia en Google Cloud y en HubSpot: lleva más de media hora y no lo vemos en clase.

- Si ya tenés n8n Cloud, seguí con esa cuenta.
- Si usás n8n local: abrí [app.n8n.cloud/register](https://app.n8n.cloud/register), escribí tu correo, hacé clic en **Continue**, completá nombre y contraseña, y abrí el enlace del correo de verificación. La prueba gratis dura 14 días.

Hoy arrancamos de un archivo nuevo: no hace falta pasar tus workflows de las clases anteriores.

## 2. Tu clave de Groq

Usá la de la Clase 2 (empieza con `gsk_`). Si no la tenés: [console.groq.com/keys](https://console.groq.com/keys) > **Create API Key** > nombre `curso-n8n` > copiala y guardala en un archivo de texto. Groq la muestra una sola vez.

## 3. Slack y el canal `#operaciones`

El de la Clase 2. Si no lo tenés, seguí el punto 3 de [antes-de-la-clase-2.md](antes-de-la-clase-2.md).

## 4. Tu cuenta gratuita de HubSpot

1. Abrí [app.hubspot.com/signup-hubspot/crm](https://app.hubspot.com/signup-hubspot/crm).
2. Hacé clic en **Sign up with Google** (o registrate con tu correo y verificá el código que te llega).
3. Respondé las preguntas del alta. Nombre de la empresa: `Muebles Roble` (o el de tu negocio). En el resto, la opción más simple. Si te ofrece probar un plan pago, seguí con el **gratuito**.
4. Tenés que llegar al inicio de HubSpot. En el menú de la izquierda, **CRM** > **Contacts**: vas a ver uno o dos contactos de ejemplo.

Las pantallas del alta de HubSpot cambian seguido: si alguna pregunta no coincide, respondé lo más simple y seguí hasta ver **Contacts**.

## 5. Dos casillas de correo

- **La casilla de soporte**: una cuenta de **Gmail**. Es la que vas a conectar a n8n. En clase el flujo solo lee los correos que dicen "Roble", así que podés usar tu Gmail personal sin que n8n toque el resto de tu correo.
- **La casilla del cliente**: cualquier otra dirección tuya (otro Gmail, el correo del trabajo, Outlook). Desde ahí vas a mandar los [correos de prueba](clase-04/correos-de-prueba.md).

No mandes los correos de prueba desde la misma cuenta que conectás a n8n: Gmail los guarda como enviados, no como recibidos, y el flujo no los ve.

## Para la pre-entrega: tu repositorio de GitHub

La pre-entrega del Módulo 4 es un archivo `.json` en un repositorio **público** de GitHub, como la del Módulo 1. Si ya tenés ese repositorio, usá el mismo. Si no tenés cuenta, creala en [github.com/signup](https://github.com/signup): el repositorio lo armamos al final de la clase.

## Comprobación

Antes de la clase tenés que poder decir que sí a estas cuatro:

- [ ] Entro a **n8n Cloud** y veo la pantalla de inicio.
- [ ] Tengo mi clave de Groq guardada en un archivo (empieza con `gsk_`).
- [ ] Entro a Slack y veo el canal `#operaciones`.
- [ ] Entro a HubSpot y veo **Contacts**.

Si algo falla, escribilo en el canal del curso con una captura de pantalla (sin claves a la vista).
