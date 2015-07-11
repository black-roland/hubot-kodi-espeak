robot = require '../src/kodi-espeak'
Promise = require 'bluebird'
url = require 'url'

if process.env.HUBOT_KODI_URL
  urlParts = url.parse process.env.HUBOT_KODI_URL
  kodiUri = "#{ urlParts.protocol }//#{ urlParts.host }"
  [ kodiUser, kodiPassword ] = urlParts.auth.split(':') if urlParts.auth

kodiRequest = (method, params) ->
  new Promise (resolve, reject) ->
    reject new Error 'Undefined HUBOT_KODI_URL' if !kodiUri

    data = JSON.stringify
      'jsonrpc': '2.0'
      'method': method
      'params': params
      'id': 1

    req = robot.http "#{ kodiUri }/jsonrpc"

    req.auth kodiUser, kodiPassword if kodiUser and kodiPassword

    req.post(data) (err, res, body) ->
      return reject err if err
      return reject new Error 'Unauthorized' if res.statusCode == 401
      resolve body

module.exports.play = (url) ->
  kodiRequest 'Player.Open',
    'item':
      'file': url
