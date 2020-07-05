import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home'
import SignIn from './views/SignIn'
import NewIncident from './views/User/NewIncident'
import IncidentList from './views/User/IncidentList'
import UserProfile from './views/UserProfile'
import { ifAuthenticated, ifNotAuthenticated } from '@helpers/router-redirections'
import { omniAuthRedirection } from '@helpers/omni-auth-service'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/login',
      name: 'signIn',
      component: SignIn,
      meta: { layout: 'no-app-bar' },
      beforeEnter: ifNotAuthenticated
    },
    {
      path: '/user_profile',
      name: 'profile',
      component: UserProfile,
      beforeEnter: ifAuthenticated
    },
    {
      path: '/new_incident',
      name: 'newIncident',
      component: NewIncident,
      beforeEnter: ifAuthenticated
    },
    {
      path: '/incident_list',
      name: 'incidentList',
      component: IncidentList,
      beforeEnter: ifAuthenticated
    },
  ]
})

router.beforeEach((to, from, next) => {
  if (to.path === '/omni-auth-token') { omniAuthRedirection(to) }

  next()
})

export default router
