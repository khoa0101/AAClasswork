import * as minesweeper from "../../minesweeper";
import React from 'react';
import Board from './board';
class Game extends React.Component {

  constructor(props) {
    super(props);
    this.board = new minesweeper.Board(9, 10);
    this.state = { board: this.board };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flag) {
    if (flag) {
      tile.toggleFlag();
    } else {
      tile.explore();

    }
    this.setState({ board: this.state.board })
  }

  restartGame() {
    this.board = new minesweeper.Board(9, 10);
    this.setState({ board: this.board });
  }

  render() {
    let modal;
    if (this.state.board.lost() || this.state.board.won()) {
      const text = this.state.board.won() ? "You Won!" : "You Lost!";
      modal = <div className="modal-screen">
        <div className="modal-content">
          <p>{text}</p>
          <button onClick={this.restartGame.bind(this)}>Restart Game</button>
        </div>
      </div>
    }
    return (

      <div>
        {modal}
        <Board board={this.state.board} updateGame={this.updateGame}></Board>
    </div>
    )
  }
}

export default Game;