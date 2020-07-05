import {
  FETCH_INCIDENTS,
  CREATE_INCIDENT,
  FETCH_INCIDENT,
  UPDATE_INCIDENT,
  SET_LOADING,
} from './action-types';
import api from '@/api';
import router from '@/router';

export default {
  [FETCH_INCIDENTS]: ({ commit, dispatch }, requestParams) => {
    commit(SET_LOADING, true);
    api.get('/incidents', { params: requestParams }).then((response) => {
      commit(FETCH_INCIDENTS, response);
      commit(SET_LOADING, false);
    });
  },
  [FETCH_INCIDENT]: ({ commit, dispatch }, id) => {
    return new Promise((resolve) => {
      api.get(`/incidents/${id}`).then((response) => {
        commit(FETCH_INCIDENT, response);
        resolve(response);
      });
    });
  },
  [CREATE_INCIDENT]: ({ commit, dispatch }, incident) => {
    api.post('/incidents', incident).then((response) => {
      commit('global/SET_SNACK', { message: 'createdIncident' }, { root: true });
      router.push(
        { name: 'incidentList'},
      );
    });
  },
  [UPDATE_INCIDENT]: ({ commit, dispatch }, params) => {
    api.put(`/incidents/${params.incident.number}`, params).then((response) => {
      commit('global/SET_SNACK', { message: 'updatedIncident' }, { root: true });
      commit(FETCH_INCIDENT, response);
    });
  },
};
