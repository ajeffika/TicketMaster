import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import '@mdi/font/css/materialdesignicons.css';
import 'material-design-icons-iconfont/dist/material-design-icons.css';

Vue.use(Vuetify);

const opts = {
  theme: {
    light: true,
    themes: {
      light: {
        primary: '#4a8cff',
        secondary: '#000000',
        accent: '#000161',
        error: '#ff5722',
        warning: '#ff9800',
        info: '#03a9f4',
        success: '#4caf50',
      },
    },
  },
  icons: {
    iconfont: 'md',
  },
};

export default new Vuetify(opts);
