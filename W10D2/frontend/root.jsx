import React from 'react';
import Clock from './clock';
import Weather from './weather';
import Tab from './tab';

const Root = () => {
  const tabs = [{ title : "one", content: "This is one"}, 
  { title: "two", content : "This is two"},
  { title: "three", content : "This is three"}];

  return (
    <div>
      <Clock />
      {/* <Weather /> */}
      <Tab tabs = {tabs}/>
      {/* <AutoComplete /> */}
    </div>
  )
}

export default Root;