<template>
  <cookie-law theme='base' transitionName='slideFromBottom' :buttonText="buttonTranslation">
    <div slot="message">
      <span>{{$t('cookieConsent.disclaimer')}}</span>
      <span>{{$t('cookieConsent.learnMore')}} <router-link to="cookies">Cookies</router-link></span>
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
        return this.$i18n.t('cookieConsent.agree');
      },
    },
  };
</script>
