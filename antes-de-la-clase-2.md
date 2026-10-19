# Antes de la Clase 2 (lunes 19/10)

En la Clase 2 vamos a convertir el agente del Módulo 1 en un equipo de agentes: un Manager que clasifica cada consulta y dos especialistas que trabajan para él. Necesitás tres cosas. Si te falta alguna, completala en el break de la clase (unos 15 minutos) y, hasta entonces, seguí la clase mirando.

| Qué | Para qué | Tiempo |
|---|---|---|
| 1. n8n | Donde construimos todo | 5 min |
| 2. Una clave de Groq | El modelo de lenguaje que usan los agentes (gratis) | 3 min |
| 3. Un espacio de Slack con el canal `#operaciones` | Donde el sistema deja el registro de cada consulta (lo pide la pre-entrega) | 10 min |

## 1. n8n

**Si ya usás n8n desde la Clase 1 (Cloud o local), seguí con ese.** Pasá directo al punto 2.

Si todavía no tenés n8n:

1. Abrí [app.n8n.cloud/register](https://app.n8n.cloud/register).
2. Escribí tu correo y hacé clic en **Continue**. Completá nombre y contraseña.
3. Abrí el correo de verificación de n8n y hacé clic en el enlace.
4. Avanzá hasta ver la pantalla de inicio de n8n.

IMPORTANTE: la prueba gratis de n8n Cloud dura **14 días** y, cuando vence, n8n **borra** tu espacio. Por eso, al final de cada clase vas a descargar tus workflows como archivos `.json`. Cuando la prueba venza, abrís una cuenta nueva e importás esos archivos: el proyecto sigue donde lo dejaste.

## 2. Tu clave de Groq

1. Abrí [console.groq.com/keys](https://console.groq.com/keys) e iniciá sesión (podés usar **Continue with Google**).
2. Hacé clic en **Create API Key**, escribí el nombre `curso-n8n` y confirmá.
3. Copiá la clave (empieza con `gsk_`). Groq la muestra **una sola vez**.
4. Guardala en un archivo de texto en tu computadora. Nunca la pegues en el chat de la clase ni la muestres en pantalla.

## 3. Slack y el canal `#operaciones`

1. Abrí [slack.com/get-started#/createnew](https://slack.com/get-started#/createnew) y escribí tu correo.
2. Slack te manda un código al correo: copialo en la pantalla.
3. Nombre del espacio de trabajo: `Muebles Roble` (o el nombre de tu propio negocio, si vas a aplicar el curso a tu caso).
4. Si pregunta en qué está trabajando tu equipo, escribí `operaciones`: Slack crea el canal `#operaciones`.
5. Si pide invitar a otras personas, salteá ese paso.

Si usás **n8n Cloud**, no hace falta nada más: la conexión con Slack se hace en clase con un clic.

<details>
<summary>Si usás n8n local (en tu computadora): creá también una app de Slack</summary>

En n8n local, Slack no se conecta con un clic: necesitás un "token" de una app propia. Son 5 minutos:

1. Abrí [api.slack.com/apps](https://api.slack.com/apps) y hacé clic en **Create New App** > **From a manifest**.
2. Elegí tu espacio `Muebles Roble` y hacé clic en **Next**.
3. En la pestaña **JSON**, borrá lo que haya y pegá esto:

   ```json
   {
     "display_information": { "name": "Roble n8n" },
     "features": { "bot_user": { "display_name": "Roble n8n", "always_online": true } },
     "oauth_config": { "scopes": { "bot": ["chat:write", "chat:write.public", "channels:read"] } },
     "settings": { "org_deploy_enabled": false, "socket_mode_enabled": false, "token_rotation_enabled": false }
   }
   ```

4. **Next** > **Create**.
5. En el menú de la izquierda: **OAuth & Permissions** > **Install to Workspace** > **Allow**.
6. Copiá el **Bot User OAuth Token** (empieza con `xoxb-`) y guardalo junto a tu clave de Groq. Lo usamos en clase.

</details>

## Comprobación

Antes de la clase tenés que poder decir que sí a las tres:

- [ ] Entro a n8n y veo la pantalla de inicio.
- [ ] Tengo mi clave de Groq guardada en un archivo (empieza con `gsk_`).
- [ ] Entro a Slack y veo el canal `#operaciones`.

Si algo falla, escribilo en el canal del curso con una captura de pantalla (sin la clave a la vista).
