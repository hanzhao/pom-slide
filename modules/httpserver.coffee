path = require 'path'
fs = require 'fs'
express = require 'express'
app = express()
http = require('http').Server(app)
io = require('socket.io')(http)
$ = window.$

rootPath = path.normalize __dirname + '/..'
app.use express.static rootPath
io.on 'connection', (socket) ->
  $('#act-box').show()
  socket.on 'chat', (msg) ->
    $('#response-box').val($('#response-box').val() + " " + msg)
    fs.appendFileSync '../message.log', "--- #{msg}\n"

$ ->
  $('#send-message').click (e) ->
    fs.appendFileSync '../message.log', "+++ #{$('#message-box').val()}\n"
    io.sockets.emit 'chat',
      message: $('#message-box').val(),
      for: 'everyone'
    $('#message-box').val('')
    e.preventDefault()

http.listen 8080
