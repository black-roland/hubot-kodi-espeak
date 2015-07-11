kodi = require '../lib/kodi'
robot = require './robot'

if process.env.HUBOT_ESPEAK_URL
  espeakUri = process.env.HUBOT_ESPEAK_URL.replace(/\/$/, '')
else
  espeakUri = "http://localhost:#{ process.env.EXPRESS_PORT or process.env.PORT }"
  robot.logger.info "Using default eSpeak URL: #{ espeakUri }/"

espeakVoice = process.env.HUBOT_ESPEAK_VOICE or 'en'

module.exports = (res) ->
  text = res.match[1];
  kodi.play("#{ espeakUri }/kodi-say/#{ espeakVoice }/#{ text }")
    .then () ->
      res.reply text
    .catch (err) ->
      robot.logger.error err.message
      res.reply "Error: #{ err.message }"
