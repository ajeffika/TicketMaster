import {
  AUTH_LOGOUT,
  AUTH_SUCCESS,
  SIGN_UP,
  SIGN_IN,
  UPDATE_USER,
  VALIDATE_TOKEN
} from './action-types'
import api from '@/api/index'
import router from '@/router'

export default {
  [SIGN_UP]: ({ commit, dispatch }, user) => {
    api.post('auth', user).then((response) => {
      commit(AUTH_SUCCESS, response)
      commit(UPDATE_USER, response)
      commit('global/SET_SNACK', { message: 'signedUp' }, { root: true })
      router.push({ name: 'home' })
    })
  },

  [SIGN_IN]: ({ commit, dispatch }, user) => {
    api.post('auth/sign_in', user).then((response) => {
      commit(AUTH_SUCCESS, response)
      commit(UPDATE_USER, response)
      commit('global/SET_SNACK', { message: 'signedIn' }, { root: true })
      router.push({ name: 'home' })
    }).catch(() => {
      commit('global/SET_SNACK', { message: 'incorrectCredentials' }, { root: true })
    })
  },

  [VALIDATE_TOKEN]: ({ commit }) => {
    api.get('auth/validate_token').then((response) => {
      commit(AUTH_SUCCESS, response)
      commit(UPDATE_USER, response)
      commit('global/SET_SNACK', { message: 'signedIn' }, { root: true })
      router.push({ name: 'home' })
    })
  },

  [UPDATE_USER]: ({ commit, dispatch }, user) => {
    api.patch('auth', user).then((response) => {
      commit(UPDATE_USER, response)
      commit('global/SET_SNACK', { message: 'updatedAccount' }, { root: true })
    })
  },

  [AUTH_LOGOUT]: ({ commit }) => {
    api.delete('auth/sign_out').then(() => {
      commit(AUTH_LOGOUT)
      commit('global/SET_SNACK', { message: 'loggedOut' }, { root: true })
    })
  }
}
