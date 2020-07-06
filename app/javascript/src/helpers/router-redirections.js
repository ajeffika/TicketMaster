import store from '@store'

export const ifNotAuthenticated = (to, from, next) => {
  if (!store.getters['auth/isAuthenticated']) {
    next()
    return
  }
  next({ name: 'home' })
}

export const ifAuthenticated = (to, from, next) => {
  if (store.getters['auth/isAuthenticated']) {
    next()
    return
  }
  next({ name: 'signIn' })
}

export const ifAdminAuthenticated = (to, from, next) => {
  if (store.getters['auth/isAdminAuthenticated']) {
    next()
    return
  }
  next({ name: 'adminHome' })
}

