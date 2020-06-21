import {
  FETCH_CATEGORIES,
  FETCH_SUBCATEGORIES
} from './action-types'
import api from '@/api'

export default {
  [FETCH_CATEGORIES]: ({ commit }) => {
    api.get('/categories', { params: { is_parent: 'true' } }).then((response) => {
      commit(FETCH_CATEGORIES, response)
    })
  },
  [FETCH_SUBCATEGORIES]: ({ commit }) => {
    api.get('/categories', { params: { is_parent: 'false' } }).then((response) => {
      commit(FETCH_SUBCATEGORIES, response)
    })
  }
}
