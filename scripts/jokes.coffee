module.exports = (robot) ->
  robot.hear /beach/i, (res) ->
    res.send "To the beach we GOOOOO!"

  robot.hear /meet/i, (res) ->
    res.send "Did someone say... meat sheets?"

  robot.hear /norbet/i, (res) ->
    res.send "That's not my name. Hey, that's not my name. https://youtu.be/v1c2OfAzDTI"

  robot.hear /nobert/i, (res) ->
    res.send "No bert?"

  robot.respond /open the (.*) doors/i, (res) ->
    doorType = res.match[1]
    if doorType is "pod bay"
      res.reply "I'm afraid I can't let you do that."
    else
      res.reply "Opening the #{doorType} doors"
