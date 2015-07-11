# [hubot-kodi-espeak](https://github.com/black-roland/hubot-kodi-espeak)
Speaks any text using Kodi and eSpeak.

## Description
The script streams audio (text to WAV by eSpeak) at the URL: `http://hubot-http.example.org/kodi-say/en/hello world`. Command `hubot say hello world` sends this URL to Kodi.

## Configuration
`HUBOT_KODI_URL` — URL of Kodi instance. Ex.: `http://kodi.lan/`.

`HUBOT_KODI_USER` — Kodi HTTP auth user (optional).

`HUBOT_KODI_PASSWORD` — Kodi HTTP auth password (optional).

`HUBOT_ESPEAK_URL` — URL of Hubot HTTP server used by Kodi (optional, defaults `http://{EXPRESS_USER}:{EXPRESS_PASSWORD}@localhost:{EXPRESS_PORT}`).

`HUBOT_ESPEAK_VOICE` — eSpeak voice (optional, defaults "en").

## Commands
hubot say &lt;text&gt; — say &lt;text&gt; using Kodi speakers
