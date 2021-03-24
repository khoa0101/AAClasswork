import React from 'react';

class Clock extends React.Component{
  constructor(props){
    super(props);

    this.state = { date : new Date() };
    this.tick = this.tick.bind(this);
  }

  tick(){
    this.setState({date : new Date()})
  }

  componentDidMount(){
    this.id = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.id);
  }

  time(){
    let hour = this.state.date.getHours();
    let minute = this.state.date.getMinutes();
    let second = this.state.date.getSeconds();
    let timeZone = this.state.date.toString().match(/\(([A-Za-z\s].*)\)/)[1];
    timeZone = timeZone.split(" ");
    for (let i = 0; i < timeZone.length; i++){
      timeZone[i] = timeZone[i][0];
    }
    timeZone = timeZone.join("");
    let string = (hour < 10 ? ("0" + hour) : hour) + ":" 
      + (minute < 10 ? ("0" + minute) : minute) + ":"
      + (second < 10 ? ("0" + second) : second) + " " +timeZone;
    return string;
  }

  date() {
    let string = this.state.date.toString().slice(0, 16);
    return string;
  }

  render(){
    return (
      <div>
        <h1>Clock</h1>
          <ul className="clock">
            <li>Time: <p>{this.time()}</p></li>
            <li>Date: <p>{this.date()}</p></li>
          </ul>
      </div>
    )
  }

}

export default Clock;