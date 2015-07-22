module.exports = (robot) ->
  Firebase = require('firebase')
  ref = new Firebase('https://status-checker.firebaseio.com/projects')

  robot.respond /check in/i, (res) ->
    res.send "Checking in initiated..."
    res.send "What have you been working on lately?"
    ref.once 'value', ((snapshot) ->
      data = snapshot.exportVal();
      res.send data.name
      return
    ), (errorObject) ->
      res.send 'The read failed: ' + errorObject.code
      return

  robot.respond /i'm working on (.*)/i, (res) ->
    task = res.match[1]
    robot.brain.set 'task', task
    res.reply "#{task}"

  robot.respond /what am i working on?/i, (res) ->
    task = robot.brain.get('task')
    res.reply "You're working on #{task}."
