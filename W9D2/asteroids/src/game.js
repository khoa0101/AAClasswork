const Asteroid = require('./asteroid.js');

function Game()
{
  this.DIM_X = 1920;
  this.DIM_Y = 1080;
  this.NUM_ASTEROIDS = 100;
  this.asteroids = [];
  for (let i = 0; i < this.NUM_ASTEROIDS; i++)
  {
    this.addAsteroids();
  }
}

Game.prototype.addAsteroids = function(){
  //let that = this;
  let asteroid = new Asteroid({
    pos: this.randomPosition(),
    vel: [10, 10]
  })
  this.asteroids.push(asteroid);
}

Game.prototype.randomPosition = function(){
  let X = Math.floor(Math.random() * this.DIM_X);
  let Y = Math.floor(Math.random() * this.DIM_Y);
  return [X, Y];
}

Game.prototype.draw = function(ctx){
  ctx.clearRect(0, 0, 1920, 1080);
  this.asteroids.forEach(function(el){
    el.draw(ctx);
  })
}

module.exports = Game;