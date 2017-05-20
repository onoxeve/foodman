App.food = App.cable.subscriptions.create "FoodChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#broadcast_food').prepend data['food']

  upload: (food) ->
    # 後で利用するかも