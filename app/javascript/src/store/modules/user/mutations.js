import {
  FETCH_USER,
  FETCH_USERS,
  SET_LOADING,
} from './action-types';

export default {
  [FETCH_USERS]: (state, { data }) => {
    state.list = data.users;
    state.meta = data.meta;
  },
  [FETCH_USER]: (state, { data }) => {
    state.record = data.user;
  },
  [SET_LOADING]: (state, attr) => {
    state.recordsAreLoading = attr;
  },
};