import actions from './actions'
import getters from './getters'
import mutations from './mutations'

const state = {
  subCategories: [],
  categories: [],
  record: {
    name: ''
  }
}

export default {
  namespaced: true,
  state,
  actions,
  getters,
  mutations
}
