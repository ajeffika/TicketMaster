import store from '@store'
import { REFRESH_TOKEN, VALIDATE_TOKEN } from '@store/modules/auth/action-types'

export const omniAuthRedirection = (to) => {
  const query = to.query
  const headers = { uid: query.uid, client: query.client_id, 'access-token': query.auth_token }
  store.commit(`auth/${REFRESH_TOKEN}`, headers)
  store.dispatch(`auth/${VALIDATE_TOKEN}`)
}

export default {
  computed: {
    redirectUrl() {
      return `${window.location.origin}/omni-auth-token`
    }
  }
}
