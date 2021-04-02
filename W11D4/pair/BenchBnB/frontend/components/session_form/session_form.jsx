import React from 'react';

class SessionForm extends React.Component{
  constructor(props){
    super(props);
    this.state= {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleUpdate(field) {
    return e => this.setState({
      [field]: e.target.value
    })
  }

  handleSubmit(e){
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  renderErrors(){
    return (
      <ul>
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}`}>
            {error}
          </li>
        ))}
      </ul>
    )
  }

  render() {
    return (
      <div className="login-form-container">
        <form onSubmit={this.handleSubmit} className="login-form-box">
          Welcome to BenchBnb!
          <br/>
          Please {this.props.formType} or {this.props.navLink}
          {this.renderErrors()}
          <div className="login-form">
            <br/>
            <label>Username
              <input type="text" value={this.state.username}
              onChange={this.handleUpdate('username')} className="login-input"/>
            </label>
            &nbsp;
            <label>Password
              <input type="password" value={this.state.password}
              onChange={this.handleUpdate('password')} className="login-input"/>
            </label>
            <button className="session-submit">{this.props.formType}</button>
          </div>
        </form>
      </div>
    )
  }
}

export default SessionForm