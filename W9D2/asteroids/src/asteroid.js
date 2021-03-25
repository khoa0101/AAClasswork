const MovingObject = require('./moving_object.js');
const Utility = require('./util.js');

function Asteroid(obj)
{
  obj.color = "gray";
  obj.radius = 25;
  MovingObject.call(this, obj);
}
Utility.inherits(Asteroid, MovingObject);


module.exports = Asteroid;