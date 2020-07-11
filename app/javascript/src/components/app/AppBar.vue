<template>
  <v-app-bar app clipped-left dark>
    <div>
      <v-toolbar-title v-if="isAuthenticated" :to="{name: 'home'}" class="headline brand-name-title d-flex align-center">
        <router-link tag='div' :to="{name: 'home'}" class="app-bar-title">
          <span class="brand-name-bold">{{$t('app.appBar.appName')}}</span>
        </router-link>
      </v-toolbar-title>
    </div>
    <v-spacer></v-spacer>
    <v-btn
      v-if="isAuthenticated"
      rounded
      class="white--text font-weight-bold px-6"
      color="black"
      :to="{name: 'profile'}"
    >
      {{$t('app.appBar.yourProfile')}}
    </v-btn>
    <v-btn
      v-if="isAdminAuthenticated"
      rounded
      class="white--text font-weight-bold px-6"
      color="black"
      :to="{name: 'adminHome'}"
    >
      {{$t('app.appBar.adminHome')}}
    </v-btn>
    <div class="hidden-md-and-up">
    </div>
    <v-toolbar-items v-if="isAuthenticated" class="hidden-sm-and-down">
      <user-options-list/>
    </v-toolbar-items>
    <div v-else class="hidden-sm-and-down button-spacing">
      <v-btn rounded color="black" class="white--text" :to="{name: 'signIn'}">{{$t('app.appBar.signIn')}}
      </v-btn>
    </div>
  </v-app-bar>
</template>

<script>
  import {mapGetters} from 'vuex'
  import UserOptionsList from './partials/UserOptionsList'

  export default {
    name: 'AppBar',
    components: {UserOptionsList},
    props: ['params'],
    computed: {
      ...mapGetters({
        isAuthenticated: 'auth/isAuthenticated',
        isAdminAuthenticated: 'auth/isAdminAuthenticated',
        incidents: 'incident/list',
        user: 'auth/user',
      })
    },
    methods: {
      toggleDrawer() {
        this.params.drawer = !this.params.drawer
      }
    }
  }
</script>

<style lang="scss" scoped>
  .app-bar-title {
    cursor: pointer
  }
</style>
