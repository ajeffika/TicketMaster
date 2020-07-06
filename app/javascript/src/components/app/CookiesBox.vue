<template>
  <cookie-law theme='blood-orange' transitionName='slideFromBottom' :buttonText="buttonTranslation">
    <div slot="message">
      <span>{{$t('global.cookieConsent.disclaimer')}}</span>
      <span>{{$t('global.cookieConsent.learnMore')}} <router-link to="cookies">Cookies</router-link></span>
    </div>
  </cookie-law>
</template>

<script>
  import CookieLaw from 'vue-cookie-law';

  export default {
    name: 'CookieBox',
    components: { CookieLaw },
    computed: {
      buttonTranslation() {
        return this.$i18n.t('global.cookieConsent.agree');
      },
    },
  };
</script>
