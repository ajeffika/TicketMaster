<template>
  <v-navigation-drawer
    app
    v-model="params.drawer"
    clipped
    color="secondary"
    class="navigation-drawer"
  >
    {{userName}}
  </v-navigation-drawer>
</template>

<script>
  import { mapGetters } from 'vuex';

  export default {
    name: 'Sidebar',
    props: ['params'],
    computed: {
      ...mapGetters({
        user: 'auth/user',
      }),

      userName() {
        return `${this.user.firstName} ${this.user.lastName}`;
      },
    },
  };
</script>

<style lang="scss" scoped>
  .navigation-drawer {
    width: 235px !important;
  }
</style>