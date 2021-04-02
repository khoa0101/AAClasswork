import { combineReducers} from 'redux';
import entities from './entities_reducers';
import session from './session_reducer';
import errors from './errors_reducer';

const rootReducer = combineReducers({
    entities,
    session,
    errors
})

export default rootReducer;


    

