import * as APIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const receive_current_user = currentUser => ({
    type: RECEIVE_CURRENT_USER,
    currentUser
});

export const logout_current_user = () => ({
    type: LOGOUT_CURRENT_USER
})

export const receive_errors = errors => ({
    type: RECEIVE_SESSION_ERRORS,
    errors
})

export const signup = user => dispatch => (
    APIUtil.login(user).then(user =>(dispatch(receive_current_user(user))),
    errors => (dispatch(receive_errors(errors.responseJSON)))));

export const login = user => dispatch => (
    APIUtil.login(user).then(user =>(dispatch(receive_current_user(user))),
    errors => (dispatch(receive_errors(errors.responseJSON)))));


    export const logout = () => dispatch => (
    APIUtil.logout().then(user =>(dispatch(logout_current_user()))));
