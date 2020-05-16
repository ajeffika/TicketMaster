<template>
  <v-app>
    <v-content>
      <component :is="layout">
        <router-view></router-view>
      </component>
    </v-content>
    <snack-bar-notifications/>
  </v-app>
</template>

<script>
  import SnackBarNotifications from './components/global/SnackBarNotifications';

  const defaultLayout = 'default';

  export default {
    name: 'App',
    components: { SnackBarNotifications },
    computed: {
      layout() {
        return (this.$route.meta.layout || defaultLayout) + '-layout';
      },
    },
  };
</script>
