import Vue from 'vue'
import Vuex from 'vuex'
import authModule from './modules/auth'
import globalModule from './modules/global'
import incidentModule from './modules/incident'
import categoryModule from './modules/category'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store(
  {
    modules: {
      auth: authModule,
      incident: incidentModule,
      category: categoryModule,
      global: globalModule
    },
    plugins: [createPersistedState()]
  }
)
