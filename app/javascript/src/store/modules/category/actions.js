import {
  FETCH_INCIDENT_CATEGORIES
} from './action-types'
import api from '@/api'

export default {
  [FETCH_INCIDENT_CATEGORIES]: ({ commit }) => {
    api.get('/categories').then((response) => {
      commit(FETCH_INCIDENT_CATEGORIES, response)
    })
  },
}
