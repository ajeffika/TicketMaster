import Vue from 'vue'
import Vuex from 'vuex'
import authModule from './modules/auth'
import globalModule from './modules/global'
import incidentModule from './modules/incident'
import userModule from './modules/user'
import categoryModule from './modules/category'
import groupModule from './modules/group'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store(
  {
    modules: {
      auth: authModule,
      incident: incidentModule,
      user: userModule,
      category: categoryModule,
      group: groupModule,
      global: globalModule
    },
    plugins: [createPersistedState()]
  }
)
