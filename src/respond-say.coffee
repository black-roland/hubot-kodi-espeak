kodi = require '../lib/kodi'

espeakUri = if process.env.HUBOT_ESPEAK_URL
then process.env.HUBOT_ESPEAK_URL.replace(/\/$/, '')
else "http://localhost:#{ process.env.EXPRESS_PORT or process.env.PORT }"

espeakVoice = process.env.HUBOT_ESPEAK_VOICE or 'en'

module.exports = (res) ->
  text = res.match[1];
  kodi.play("#{ espeakUri }/kodi-say/#{ espeakVoice }/#{ text }")
    .then () ->
      res.reply text
    .catch (err) ->
      robot.logger.error err.message
      res.reply "Error: #{ err.message }"
