Promise = require('bluebird')
espeak = Promise.promisifyAll(require('espeak'))

module.exports = (robot) ->
  robot.router.get '/kodi-say/:voice/:text', (req, res) ->
    res.set 'Content-Type', 'audio/wav';

    espeak.speakAsync(req.params.text, ["-v#{ req.params.voice }"])
      .then (wav) ->
        res.send wav.buffer
      .catch (err) ->
        robot.logger.error err.message
