$ ->
  # Foundation.global.namespace = ''
  # $(document).foundation()
  $('#fullpage').fullpage
    sectionsColor: ['#1bbc9b', '#4BBFC3', '#1bbc9b', '#4BBFC3', 'whitesmoke', '#7BAABE', '#ccddff']
    anchors: ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth']
    menu: '#menu'
    css3: true
    scrollingSpeed: 1000
  if typeof(require) isnt 'undefined'
    document.querySelector('#webview1').shadowRoot.querySelector('object').style.height = "1016px"
    document.querySelector('#webview2').shadowRoot.querySelector('object').style.height = "1016px"
    document.querySelector('#webview3').shadowRoot.querySelector('object').style.height = "1016px"
  setInterval ->
    time = new Date Date.now()
    $('#current-time').text time.toLocaleTimeString()
  , 1000
  webviewShow = 0
  $('#show-webview').click (e) ->
    webviewShow += 1
    webviewShow %= 4
    switch webviewShow
      when 0
        $('#webview1').hide()
        $('#webview2').hide()
        $('#webview3').hide()
        $('#show-webview').text 'Dark'
      when 1
        $('#webview1').show()
        $('#webview2').hide()
        $('#webview3').hide()
        $('#show-webview').text 'Flame'
      when 2
        $('#webview1').hide()
        $('#webview2').show()
        $('#webview3').hide()
        $('#show-webview').text 'Master'
      when 3
        $('#webview1').hide()
        $('#webview2').hide()
        $('#webview3').show()
        $('#show-webview').text 'Biubiubiu'
    e.preventDefault()
  $('#notification').click (e) ->
    notification = new window.Notification '我是一个桌面提示'
    notification.on 'click', ->
      this.close()

  console.log typeof(require)
  if typeof(require) is 'undefined' and typeof(process) is 'undefined'
    $('#act-box').show()
    socket = io()
    $('#send-message').click (e) ->
      socket.emit 'chat', $('#message-box').val()
      $('#message-box').val ''
      e.preventDefault()
    socket.on 'chat', (msg) ->
      $('#response-box').val($('#response-box').val() + " " + msg.message)
