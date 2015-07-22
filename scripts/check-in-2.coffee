module.exports = (robot) ->
  Firebase = require('firebase')
  ref = new Firebase('https://status-checker.firebaseio.com/projects/barcamp')

  robot.respond /check in/i, (res) ->
    res.send "Checking in initiated..."
    res.send "What have you been working on lately?"

  robot.respond /i'm working on (.*)/i, (res) ->
    task = res.match[1]
    robot.brain.set 'task', task
    res.reply "#{task}"

  robot.respond /what am i working on?/i, (res) ->
    task = robot.brain.get('task')
    res.reply "You're working on #{task}."
