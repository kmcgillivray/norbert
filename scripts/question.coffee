class Questions

  askQuestion: (resp) ->
    resp.send "Asking initiated..." +
              "What have you been working on today?"

  answerQuestion: (resp, answer) ->
    # save answer to brain/firebase
    resp.send "Cool, you're working on #{answer}."

module.exports = (robot) ->
  questions = new Questions(robot)

  robot.respond /ask me/i, (resp) ->
    questions.askQuestion(resp)

  robot.hear /^!working (.*)/, (resp) ->
    questions.answerQuestion(resp, resp.match[1])
