import { FETCH_CATEGORIES } from './action-types'

export default {
  [FETCH_CATEGORIES]: (state, { data }) => {
    state.categories = data.categories
  }
}
