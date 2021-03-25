import React from "react";
import Tile from "./tile";


class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const board = this.props.board;
    return (
      <div>
        {board.grid.map((row, i) =>{
          return (
          <div key={i}
            className="row">
            {row.map((tile, j) => {
              return (<Tile
                key={j}
                tile={tile}
                updateGame={this.props.updateGame}/>)
            })}
          </div>
          )
        })}
      </div>
    )
  };
}
export default Board;