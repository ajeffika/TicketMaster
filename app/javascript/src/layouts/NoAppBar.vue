<template>
  <v-container fluid class="container-full-height pa-0">
    <slot/>
  </v-container>
</template>

<script>
  import AppBar from '@/components/app/AppBar';
  import Sidebar from '@/components/app/Sidebar';

  export default {
    name: 'App',
    components: { AppBar, Sidebar },
    data() {
      return {
        params: {
          drawer: false,
        },
      };
    },
  };
</script>

<style lang="scss" scoped>
  .container-full-height {
    max-height: 100%;
  }
</style>
