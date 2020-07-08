import actions from './actions'
import getters from './getters'
import mutations from './mutations'

const state = {
  categories: [],
  category: {
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
