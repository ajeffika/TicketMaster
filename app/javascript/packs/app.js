import Vue from 'vue';
import App from '@/App.vue';
import en from 'vee-validate/dist/locale/en';
import router from '@/router';
import store from '@/store/index';
import messages from '@/locales/index';
import VeeValidate, { Validator } from 'vee-validate';
import VueI18n from 'vue-i18n';
import vuetify from '@/plugins/vuetify';
import interceptorsSetup from '@/helpers/interceptors';
import isUnique from '@/validators/isUnique';
import Default from '@/layouts/Default.vue';
import NoAppBar from '@/layouts/NoAppBar.vue';

Vue.component('default-layout', Default);
Vue.component('no-app-bar-layout', NoAppBar);

Vue.config.productionTip = false;

Vue.use(VueI18n);

const i18n = new VueI18n({
  locale: 'en',
  messages,
});

Vue.use(VeeValidate, {
  i18n,
  locale: 'en',
  dictionary: { en },
  inject: false,
});

Validator.extend('unique', isUnique);

interceptorsSetup();

new Vue({
  router,
  i18n,
  store,
  vuetify,
  render: h => h(App),
}).$mount('#app');
