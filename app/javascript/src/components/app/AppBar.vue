<template>
  <v-app-bar app clipped-left color="primary">
    <div>
      <v-toolbar-title :to="{name: 'home'}" class="headline brand-name-title d-flex align-center">
        <router-link tag='div' :to="{name: 'home'}" class="app-bar-title">
          <span class="brand-name-bold">{{$t('app.appBar.appName')}}</span>
        </router-link>
      </v-toolbar-title>
    </div>
    <v-spacer></v-spacer>
    <div class="hidden-sm-and-down mr-6">
      <v-btn text class="font-weight-bold" :to="{name: 'contactUs'}">{{$t('app.appBar.tickets')}}</v-btn>
      <discover-options-list />
      <entries-options-list />
    </div>
    <v-btn
      v-if="isAuthenticated"
      rounded
      class="white--text font-weight-bold px-6"
      color="black"
      :to="{name: 'profile'}"
    >
      {{$t('app.appBar.yourProfile')}}
    </v-btn>
    <div class="hidden-md-and-up">
      <mobile-menu></mobile-menu>
    </div>
    <v-toolbar-items v-if="isAuthenticated" class="hidden-sm-and-down">
      <user-options-list />
    </v-toolbar-items>
    <div v-else class="hidden-sm-and-down button-spacing">
      <v-btn rounded color="black" class="white--text" :to="{name: 'signIn'}">{{$t('app.appBar.signIn')}}</v-btn>
      <v-btn text color="black" class="font-weight-bold" :to="{name: 'signUp'}">{{$t('app.appBar.signUp')}}</v-btn>
    </div>
  </v-app-bar>
</template>

<script>
  import { mapGetters } from 'vuex'
  import UserOptionsList from './partials/UserOptionsList'

  export default {
    name: 'AppBar',
    components: {  UserOptionsList },
    props: ['params'],
    computed: {
      ...mapGetters({
        isAuthenticated: 'auth/isAuthenticated',
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
