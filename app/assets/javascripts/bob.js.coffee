$ ->
  newMood = (action) ->
    if action is "kick" then "sad" else "happy"

  states =
    happy:
      mood: "happy"
      button: "Kick him in the pants"
      action: "kick"
      nextState: "sad"

    sad:
      mood: "sad"
      button: "Tell him a joke"
      action: "joke"
      nextState: "happy"

  actions = $("button").asEventStream("click").map((e) ->
    $(e.target).data "action"
  )

  guessedMoods = actions.map(newMood)

  results = actions.flatMapLatest((action) ->
    Bacon.fromPromise $.ajax(type: "POST", url: "/bob/#{action}")
  )

  results.onValue (result) ->
    $("#message").text result.message

  actualMoods = results.map(".mood")

  moodStream = guessedMoods.merge(actualMoods).toProperty("happy")

  moodStream.onValue (newMood) ->
    state = states[newMood]
    $('#mood').text state.mood
    $("#next_action").text state.action
    $("button")
      .text state.button
      .data "action", state.action

