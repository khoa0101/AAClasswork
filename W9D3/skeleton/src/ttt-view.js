class View {
  constructor(game, $el) {
    this.game = game;
    this.setupBoard($el);
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard($el) {
    let grid = $('<ul class=".grid-ul"></ul>');
    let square = $('<li class=".square"></li>');
    $el.append(grid);
    grid.append(square);
  }
}

module.exports = View;
