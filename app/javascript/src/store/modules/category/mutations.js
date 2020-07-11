import { FETCH_CATEGORIES } from './action-types'
import { FETCH_CATEGORY } from './action-types'
import { FETCH_SUBCATEGORIES } from './action-types'

export default {
  [FETCH_CATEGORIES]: (state, { data }) => {
    state.categories = data.categories
  },
  [FETCH_CATEGORY]: (state, { data }) => {
    state.categories = data.data
  }
}
