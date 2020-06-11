import api from '../api/index';
import store from '@store/index';
import { REFRESH_TOKEN } from '@store/modules/auth/action-types';

export default function setup() {
  api.interceptors.request.use(function(config) {
    let token = store.getters['auth/token'];

    config.headers['access-token'] = token.accessToken;
    config.headers['client'] = token.client;
    config.headers['uid'] = token.uid;

    return config;
  });

  api.interceptors.response.use(function(response) {
    let headers = response.headers;

    if (!!headers['access-token']) {
      store.commit(`auth/${REFRESH_TOKEN}`, headers);
    }
    return response;
  }, function(error) {
    return Promise.reject(error);
  });
}
