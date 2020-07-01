<template>
  <div>
    <v-parallax
      height="800"
      :src="require('@/assets/images/techy-background.png')"
    >
    <app-bar :params="params"/>
      <snack-bar-notifications/>
        <transition name="fade" mode="out-in">
          <slot/>
        </transition>
      <cookies-box/>
      <custom-footer></custom-footer>
    </v-parallax>
  </div>
</template>

<script>
  import AppBar from '@/components/app/AppBar';
  import Sidebar from '@/components/app/Sidebar';
  import SnackBarNotifications from '@/components/global/SnackBarNotifications';
  import CookiesBox from '@/components/app/CookiesBox';
  import CustomFooter from '@/components/app/CustomFooter';

  export default {
    name: 'App',
    components: { CustomFooter, CookiesBox, SnackBarNotifications, AppBar, Sidebar },
    data() {
      return {
        params: {
          drawer: false,
          transitionName: '',
        },
      };
    },
  };
</script>

<style scoped lang="scss">
  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s ease;
  }

  .fade-enter, .fade-leave-active {
    opacity: 0;
  }

</style>
