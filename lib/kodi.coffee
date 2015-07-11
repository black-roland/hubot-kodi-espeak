robot = require '../src/robot'
Promise = require 'bluebird'

kodiUri = process.env.HUBOT_KODI_URL.replace(/\/$/, '') if process.env.HUBOT_KODI_URL

kodiRequest = (method, params) ->
  new Promise (resolve, reject) ->
    reject new Error 'Undefined HUBOT_KODI_URL' if !kodiUri

    data = JSON.stringify
      'jsonrpc': '2.0'
      'method': method
      'params': params
      'id': 1

    req = robot.http "#{ kodiUri }/jsonrpc"
    req.post(data) (err, res, body) ->
      return reject err if err
      resolve body

module.exports.play = (url) ->
  kodiRequest 'Player.Open',
    'item':
      'file': url
