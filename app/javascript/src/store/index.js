import Vue from 'vue'
import Vuex from 'vuex'
import authModule from './modules/auth'
import globalModule from './modules/global'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store(
  {
    modules: {
      auth: authModule,
      global: globalModule
    },
    plugins: [createPersistedState()]
  }
)
