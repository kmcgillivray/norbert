module.exports = function(robot) {
  var Firebase = require('firebase');
  var ref = new Firebase('https://status-checker.firebaseio.com/projects');

  robot.respond(/list/i, function(res) {
    res.send("You're working on...");
    ref.once("value", function(snapshot) {
      snapshot.forEach(function(childSnapshot) {
        var childData = childSnapshot.val();
        res.send(childData.name);
      });
    });
  });

  robot.respond(/add (.*)/i, function(res){
    var task = res.match[1];
    res.send(task);
    ref.push({
      name: task,
      status: "active"
    });
    res.send("Task added, captain!");
  });
}
