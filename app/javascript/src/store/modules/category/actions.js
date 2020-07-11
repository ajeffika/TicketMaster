import {
  FETCH_CATEGORIES,
  FETCH_CATEGORY,
  FETCH_SUBCATEGORIES
} from './action-types'
import api from '@/api'

export default {
  [FETCH_CATEGORIES]: ({ commit }) => {
    api.get('/categories', { params: { is_parent: 'true' } }).then((response) => {
      commit(FETCH_CATEGORIES, response)
    })
  },
  [FETCH_CATEGORY]: ({ commit, dispatch }, params) => {
    return new Promise((resolve) => {
      api.get(`/categories/${params.id}`).then((response) => {
        commit(FETCH_CATEGORY, response);
        resolve(response);
      });
    });
  },
}
