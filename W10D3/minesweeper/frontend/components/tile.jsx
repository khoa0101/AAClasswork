import React from "react";


class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    const flagged = e.altKey ? true : false;
    this.props.updateGame(this.props.tile, flagged);
  }

  render() {
    const tile = this.props.tile;
    let text = "";
    let klass = "";
    if (tile.explored){
      if (tile.bombed) {
        klass = "bombed"
        text = "💥";
      } else {
        klass = "explored";
        let num = tile.adjacentBombCount();
        if (num > 0){
          text = `${num}`;
        } else {
          text = "";
        };
      }
    } else if (tile.flagged) {
      klass = "flagged";
      text = "⚑";
    }
    klass = `tile ${klass}`;
    return (
      <div className={klass} onClick={this.handleClick}>
        
        {text}
      </div>
    )
  }
}
export default Tile;