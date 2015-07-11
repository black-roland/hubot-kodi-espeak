kodi = require '../lib/kodi'
robot = require './kodi-espeak'
querystring = require 'querystring'

if process.env.HUBOT_ESPEAK_URL
  espeakUri = process.env.HUBOT_ESPEAK_URL.replace(/\/$/, '')
else
  if process.env.EXPRESS_USER and process.env.EXPRESS_PASSWORD
    cred = "#{ process.env.EXPRESS_USER }:#{ process.env.EXPRESS_PASSWORD }@"
  espeakUri = "http://#{ cred or '' }localhost:#{ process.env.EXPRESS_PORT or process.env.PORT }"
  robot.logger.info "Using default eSpeak URL: #{ espeakUri }/"

espeakVoice = process.env.HUBOT_ESPEAK_VOICE or 'en'

module.exports = (res) ->
  text = res.match[1];

  speechUrl = "#{ espeakUri }/kodi-say/#{ espeakVoice }/#{ querystring.escape text }"
  robot.logger.debug "Kodi eSpeak URL: #{ speechUrl }"

  kodi.play(speechUrl)
    .then () ->
      res.reply text
    .catch (err) ->
      robot.logger.error err.message
      res.reply "Error: #{ err.message }"
