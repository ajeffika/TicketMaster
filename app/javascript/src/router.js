import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home'
import SignIn from './views/SignIn'
import NewIncident from './views/User/NewIncident'
import IncidentList from './views/User/IncidentList'
import UserProfile from './views/UserProfile'
import AdminHomePage from './views/Admin/AdminHomePage'
import AdminIncidentList from './views/Admin/AdminIncidentList'
import AdminIncidentForm from './views/Admin/AdminIncidentForm'
import AdminUserList from './views/Admin/AdminUserList'
import AdminUserForm from './views/Admin/AdminUserForm'
import { ifAuthenticated, ifNotAuthenticated, AdminAuthenticated } from '@helpers/router-redirections'
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
      path: '/admin',
      name: 'adminHome',
      meta: { layout: 'admin' },
      component: AdminHomePage,
      beforeEnter: AdminAuthenticated
    },
    {
      path: '/admin_incident_list',
      name: 'adminIncidentList',
      meta: { layout: 'admin' },
      component: AdminIncidentList,
      beforeEnter: AdminAuthenticated
    },
    {
      path: '/admin_user_list',
      name: 'adminUserList',
      meta: { layout: 'admin' },
      component: AdminUserList,
      beforeEnter: AdminAuthenticated
    },
    {
      path: '/admin_user_form',
      name: 'adminUserForm',
      meta: { layout: 'admin' },
      component: AdminUserForm,
      beforeEnter: AdminAuthenticated
    },
    {
      path: '/admin_incident_form',
      name: 'adminIncidentForm',
      meta: { layout: 'admin' },
      component: AdminIncidentForm,
      beforeEnter: AdminAuthenticated
    },
    {
      path: '/login',
      name: 'signIn',
      component: SignIn,
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
