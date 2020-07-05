import {
  FETCH_GROUPS,
  CREATE_GROUP,
  FETCH_GROUP,
  UPDATE_GROUP,
  SET_LOADING,
} from './action-types';
import api from '@/api';
import router from '@/router';

export default {
  [FETCH_GROUPS]: ({ commit, dispatch }, requestParams) => {
    commit(SET_LOADING, true);
    api.get('/groups', { params: requestParams }).then((response) => {
      commit(FETCH_GROUPS, response);
      commit(SET_LOADING, false);
    });
  },
  [FETCH_GROUP]: ({ commit, dispatch }, id) => {
    return new Promise((resolve) => {
      api.get(`/groups/${id}`).then((response) => {
        commit(FETCH_GROUP, response);
        resolve(response);
      });
    });
  },
  [CREATE_GROUP]: ({ commit, dispatch }, group) => {
    api.post('/groups', group).then((response) => {
      commit('global/SET_SNACK', { message: 'createdIncident' }, { root: true });
      router.push(
        { name: 'groupList'},
      );
    });
  },
  [UPDATE_GROUP]: ({ commit, dispatch }, params) => {
    api.put(`/groups/${params.group.number}`, params).then((response) => {
      commit('global/SET_SNACK', { message: 'updatedIncident' }, { root: true });
      commit(FETCH_GROUP, response);
    });
  },
};
