app = require 'app'
BrowserWindow = require 'browser-window'

mainWindow = null

somethingWindow = null

app.on 'window-all-closed', ->
  app.quit() if process.platform isnt 'darwin'

app.on 'ready', ->
  mainWindow = new BrowserWindow
    height: 1016
    width: 1920
    'web-preferences':
      'webgl': true
  somethingWindow = new BrowserWindow
    height: 1016
    width: 1920
    'web-preferences'
      'webgl': true
  mainWindow.loadUrl "file://#{__dirname}/index.html"
  somethingWindow.loadUrl "file://#{__dirname}/something.html"

  ###
  mainWindow.openDevTools
    detach: true
  somethingWindow.openDevTools
    detach: true
  ###
  mainWindow.on 'closed', ->
    mainWindow = null
  somethingWindow.on 'closed', ->
    somethingWindow = null
