import { FETCH_INCIDENT_CATEGORIES } from './action-types'

export default {
  [FETCH_INCIDENT_CATEGORIES]: (state, { data }) => {
    state.instrumentCategories = data.categories
  }
}
