App.food = App.cable.subscriptions.create "FoodChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    #$('#new_food').append data['food']
    #alert data['message']
    
    #alert("test")
    $('#new_food').prepend data['food']

  speak: (message) ->
    @perform 'speak' , message: message

  upload: (food) ->
    @perform 'upload', food: food