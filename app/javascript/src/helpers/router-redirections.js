import store from '@store'

export const ifNotAuthenticated = (to, from, next) => {
  if (!store.getters['auth/isAuthenticated']) {
    next()
    return
  }
  next({name: 'home'})
}

export const ifAuthenticated = (to, from, next) => {
  if (store.getters['auth/isAuthenticated']) {
    next()
    return
  }
  next({name: 'signIn'})
}

export const ifAdminAuthenticated = (to, from, next) => {
  if (store.getters['auth/isAdminAuthenticated']) {
    next()
    return
  }
  next({name: 'home'})
}

export const ifNotAdminAuthenticated = (to, from, next) => {
  if (!store.getters['auth/isAdminAuthenticated']) {
    next()
    return
  }
  next({name: 'adminHome'})
}
export const AdminAuthenticated = (to, from, next) => {
  const authUser = store.getters['auth/user']
  if (authUser.role === 'admin') {
    console.log('admin')
    next()
  } else {
    console.log('not admin')
    next('/')
  }
}


