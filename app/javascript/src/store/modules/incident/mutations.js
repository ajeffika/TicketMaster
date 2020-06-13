import {
  FETCH_INCIDENT,
  FETCH_INCIDENTS,
  SET_LOADING,
} from './action-types';

export default {
  [FETCH_INCIDENTS]: (state, { data }) => {
    state.list = data.incidents;
    state.meta = data.meta;
  },
  [FETCH_INCIDENT]: (state, { data }) => {
    state.record = data.incident;
  },
  [SET_LOADING]: (state, attr) => {
    state.recordsAreLoading = attr;
  },
};