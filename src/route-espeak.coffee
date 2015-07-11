Promise = require 'bluebird'
espeak = Promise.promisifyAll require 'espeak'

module.exports = (req, res) ->
    res.set 'Content-Type', 'audio/wav';

    espeak.speakAsync(req.params.text, ["-v#{ req.params.voice }"])
      .then (wav) ->
        res.send wav.buffer
      .catch (err) ->
        robot.logger.error err.message
