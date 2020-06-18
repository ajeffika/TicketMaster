import {
  FETCH_CATEGORIES
} from './action-types'
import api from '@/api'

export default {
  [FETCH_CATEGORIES]: ({ commit }) => {
    api.get('/categories').then((response) => {
      commit(FETCH_CATEGORIES, response)
    })
  },
}
