# Description:
#   Speaks any text using Kodi and eSpeak.
#
# Dependencies:
#   "bluebird": "^2.9.33"
#   "espeak": "^0.0.3"
#
# Configuration:
#   HUBOT_KODI_URL
#   HUBOT_KODI_USER
#   HUBOT_KODI_PASSWORD
#   HUBOT_ESPEAK_URL (optional, defaults "http://{EXPRESS_USER}:{EXPRESS_PASSWORD}@localhost:{EXPRESS_PORT}")
#   HUBOT_ESPEAK_VOICE (optional, defaults "en")
#
# Commands:
#   hubot say <text> - speak <text> using Kodi speakers
#
# Author:
#   black-roland
#

module.exports = (robot) ->
  module.exports = robot

  robot.router.get '/kodi-say/:voice/:text', require './route-espeak'
  robot.respond /say (.*)/i, require './respond-say'
