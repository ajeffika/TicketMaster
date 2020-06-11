import {
  FETCH_MESSAGES,
  CREATE_MESSAGE,
  SET_CREATED
} from './action-types';

export default {
  [FETCH_MESSAGES]: (state, { data }) => {
    state.list = data.messages;
  },
  [SET_CREATED]: (state, attr) => {
    state.created = attr;
  }
};
