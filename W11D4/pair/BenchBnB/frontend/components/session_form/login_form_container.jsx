import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import SessionForm from './session_form';
import React from 'react';
import { login } from '../../actions/session_actions';
import errorsReducer from '../../reducers/errors_reducer';

const mapStatetoProps = ({errors}) => {
  return {
    errors: errors.session,
    formType: 'login',
    navLink: <Link to="/signup">signup instead</Link>
  }
}
const mapDispatchToProps = dispatch => {
  return {
    processForm: user => dispatch(login(user))
  }
}

export default connect(mapStatetoProps, mapDispatchToProps)(SessionForm);