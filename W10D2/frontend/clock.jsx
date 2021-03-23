import React from 'react';
import { render } from 'react-dom';

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
    let string = (hour < 10 ? ("0" + hour) : hour) + ":" 
      + (minute < 10 ? ("0" + minute) : minute) + ":"
      + (second < 10 ? ("0" + second) : second) + " " +timeZone;
    return string;
  }

  render(){
    console.log(this.state.date);
    return (
      <div>
        <h1>Clock</h1>
          <ul>
            <li>Time: {this.time()}</li>
            <li>Date: </li>
          </ul>
      </div>
    )
  }

}

export default Clock;