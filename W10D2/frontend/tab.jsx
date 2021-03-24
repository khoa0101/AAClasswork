import React from 'react';
import { render } from 'react-dom';

class Tab extends React.Component{
  constructor(props){
    super(props);
    this.state = { tabIndex : 0 };
    this.changeTab = this.changeTab.bind(this);
  }

  changeTab(e){
    this.setState({tabIndex : e.target.key});
    console.log(e.target.key);
  }


  render(){
    const tabs = this.props.tabs.map((tab, index) => {
      return (
        <li key={`${index}-${tab}`} onClick={this.changeTab}>
          <h1 >{tab.title}</h1>
          <article>{tab.content}</article>
        </li>
        )
    })
    return (
      <div>
        <h1>Tabs</h1>
        <ul>
          {tabs}
        </ul>
      </div>
    )
  }
}

export default Tab;