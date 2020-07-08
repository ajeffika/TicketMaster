import {
  FETCH_USERS,
  CREATE_USER,
  FETCH_USER,
  UPDATE_USER,
  SET_LOADING,
} from './action-types';
import api from '@/api';
import router from '@/router';

export default {
  [FETCH_USERS]: ({ commit, dispatch }, requestParams) => {
    commit(SET_LOADING, true);
    api.get('/users', { params: requestParams }).then((response) => {
      commit(FETCH_USERS, response);
      commit(SET_LOADING, false);
    });
  },
  [FETCH_USER]: ({ commit, dispatch }, params) => {
    return new Promise((resolve) => {
      api.get(`/users/${params.id}`).then((response) => {
        commit(FETCH_USER, response);
        resolve(response);
      });
    });
  },
  [CREATE_USER]: ({ commit, dispatch }, user) => {
    api.post('/users', user).then((response) => {
      commit('global/SET_SNACK', { message: 'createdUser' }, { root: true });
      router.push(
        { name: 'userList'},
      );
    });
  },
  [UPDATE_USER]: ({ commit, dispatch }, params) => {
    api.put(`/users/${params.user.number}`, params).then((response) => {
      commit('global/SET_SNACK', { message: 'updatedUser' }, { root: true });
      commit(FETCH_USER, response);
    });
  },
};
