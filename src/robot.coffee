module.exports = (robot) ->
  module.exports = robot

  robot.router.get '/kodi-say/:voice/:text', require './route-espeak'
  robot.respond /say (.*)/i, require './respond-say'
