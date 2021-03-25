const Game = require('./game.js');
const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');

window.addEventListener("DOMContentLoaded", (event) => {
  window.ctx = document.getElementById("gm-canvas").getContext('2d');
  newGame.draw(window.ctx);
});

let newGame = new Game();
