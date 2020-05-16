import {
  FETCH_MESSAGES,
  CREATE_MESSAGE,
  SET_CREATED
} from './action-types';
import api from '@/api';
import router from '@/router';

export default {
  [FETCH_MESSAGES]: ({ commit, dispatch }, requestParams) => {
    api.get('/messages', { params: requestParams }).then((response) => {
      commit(FETCH_MESSAGES, response);
    });
  },
  [CREATE_MESSAGE]: ({ commit, dispatch }, message) => {
    commit('SET_CREATED', false)
    api.post('/messages', message).then(() => {
      commit('SET_CREATED', true)
    });
  },
};
