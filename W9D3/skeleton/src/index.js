const View = require('./ttt-view.js')// require appropriate file
const Game = require('./game.js')// require appropriate file

  $(() => {
    let el = $('.ttt');
    const newGame = new Game();
    const view = new View(newGame, el);
    view.bindEvents();
  });
