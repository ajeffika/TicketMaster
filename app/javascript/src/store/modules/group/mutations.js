import {
  FETCH_GROUP,
  FETCH_GROUPS,
  SET_LOADING,
} from './action-types';

export default {
  [FETCH_GROUPS]: (state, { data }) => {
    state.list = data.groups;
    state.meta = data.meta;
  },
  [FETCH_GROUP]: (state, { data }) => {
    state.record = data.group;
  },
  [SET_LOADING]: (state, attr) => {
    state.recordsAreLoading = attr;
  },
};