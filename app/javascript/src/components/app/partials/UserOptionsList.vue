<template>
  <v-menu offset-y open-on-hover>
    <template v-slot:activator="{ on }">
      <v-btn text v-on="on">
<!--        <v-avatar color="black">-->
<!--          <span class="white&#45;&#45;text headline">{{avatarOrInitial}}</span>-->
<!--        </v-avatar>-->
      </v-btn>
    </template>
    <v-list color="primary" dense>
      <v-list-item-group>
        <v-list-item :to="{name: 'myEntries'}">
          <v-list-item-content>
            <v-list-item-title>
              {{$t('app.appBar.myEntries')}}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{name: 'profile'}">
          <v-list-item-content>
            <v-list-item-title>
              {{$t('app.appBar.profile')}}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-content @click="logout">
            <v-list-item-title>
              {{$t('app.appBar.logout')}}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
  </v-menu>
</template>

<script>
  import { mapGetters } from 'vuex'
  import { AUTH_LOGOUT } from '@/store/modules/auth/action-types'

  export default {
    name: 'UserOptionsList',
    computed: {
      ...mapGetters({
        user: 'auth/user'
      }),

      userName() {
        return `${this.user.firstName} ${this.user.lastName}`
      },
      avatarOrInitial() {
        const userAvatar = this.user.avatarUrl

        return userAvatar ? userAvatar : `${this.user.firstName.charAt(0)}${this.user.lastName.charAt(0)}`
      }
    },
    methods: {
      logout() {
        this.$store.dispatch(`auth/${AUTH_LOGOUT}`)
      }
    }
  }
</script>
