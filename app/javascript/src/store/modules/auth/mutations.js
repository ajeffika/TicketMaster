import {
  AUTH_LOGOUT,
  AUTH_SUCCESS,
  UPDATE_USER,
  REFRESH_TOKEN
} from './action-types'
import actionCableSetup from '@/helpers/action-cable'

export default {
  [AUTH_SUCCESS]: (state, {data, headers}) => {
    state.token = {
      accessToken: headers['access-token'],
      client: headers.client,
      uid: headers.uid
    }

    state.isLoading = false
    state.signedIn = true
    actionCableSetup()
  },

  [UPDATE_USER]: (state, {data}) => {
    const userData = data.data

    state.user = {
      id: userData['id'],
      firstName: userData['firstName'],
      lastName: userData['lastName'],
      email: userData['email'],
      username: userData['username'],
      role: userData['role'],
      groupsIds: userData['groups']
    }
  },

  [AUTH_LOGOUT]: (state) => {
    state.user = {permissions: {}}
    state.token = {}
    state.signedIn = false
  },

  [REFRESH_TOKEN]: (state, headers) => {
    state.token = {
      accessToken: headers['access-token'],
      client: headers.client,
      uid: headers.uid
    }

    state.isLoading = false
    state.signedIn = true
  }
}
