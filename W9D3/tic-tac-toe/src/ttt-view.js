class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    const ul = $('.grid-ul');
    ul.on('click', "li" , (e) => {
      console.log("current target", e.currentTarget);
      console.log("target", e.target);
      const square = $(e.currentTarget);
      this.makeMove(square);
    });
  };
  
  makeMove($square) {
    const pos = $square.data('pos');
    const mark = this.game.currentPlayer;
    try {
      this.game.playMove(pos);
    } catch(e){
      alert('This ' + e.msg.toLowerCase());
      return; 
    }
    $square.addClass(mark);
    if (this.game.board.isOver()) {
      $('.square').click(function(){return false;});
      $('.square').hover(function(){return false;});
      this.$el.addClass('game-over');
      if (this.game.winner()) {
        const winner = this.game.winner();
        const caption = $(`<p>You win, ${winner}!</p>`);
        this.$el.append(caption);
        $(`.${winner}`).addClass('won');
      } else {
        const caption = $(`<p>It's a tie...</p>`);
        this.$el.append(caption);

      };
    };
  };

  setupBoard() {
    let grid = $('<ul class="grid-ul"></ul>');
    this.$el.append(grid);
    for(let i = 0; i < 3; i++) {
      for(let j = 0; j < 3; j++) {
      let square = $('<li class="square"></li>');
      square.data('pos', [i, j])
      grid.append(square);
      }
    }
  };
}

module.exports = View;
