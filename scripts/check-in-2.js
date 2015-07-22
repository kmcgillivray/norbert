module.exports = function(robot) {
  var Firebase = require('firebase');
  var ref = new Firebase('https://status-checker.firebaseio.com/projects');

  robot.respond(/check/i, function(res) {
    res.send("This is a check!");
  });
}
