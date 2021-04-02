import { connect } from 'react-redux';
import { logout } from '../../actions/session_actions';
import Greeting from './greeting';

const mapStatetoProps = ({ session, entities: { users }}) => {
  return {
    currentUser: users[session.id]
  };
} 

const mapDispatchtoProps = dispatch => ({
  logout: () => dispatch(logout())
})

export default connect(mapStatetoProps, mapDispatchtoProps)(Greeting);