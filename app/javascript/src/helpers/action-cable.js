import Vue from 'vue';
import store from '../store/index';
import ActionCableVue from 'actioncable-vue';

export default function setup() {
  const token = store.getters['auth/token'];

  if (!!token.client) {
    Vue.use(ActionCableVue, {
      debugLevel: 'error',
      connectionUrl: `/cable?access-token=${token.accessToken}&client=${token.client}&uid=${token.uid}`,
    });
  }
}