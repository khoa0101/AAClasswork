function Surrogate(){}

Function.prototype.inherits = function(parent_class)
{
  Surrogate.prototype = parent_class.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

function MovingObject () {}
MovingObject.prototype.moves = function()
{
  return "Moving...";
}

function Ship () {}
Ship.inherits(MovingObject);
Ship.prototype.fly = function()
{
  return "Fly!";
}


function Asteroid () {}
Asteroid.inherits(MovingObject);
Asteroid.prototype.land = function()
{
  return "Oh no...";
}


let moveObj = new MovingObject();
let ship = new Ship();
let asteroid = new Asteroid();

console.log(moveObj.moves());
console.log(ship.moves());
console.log(asteroid.moves());
//console.log(moveObj.fly());
console.log(ship.fly());
console.log(asteroid.land());