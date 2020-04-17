import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import '@mdi/font/css/materialdesignicons.css'

const opts = {
  icons: {
    iconfont: 'mdi'
  },
  theme: {
    themes: {
      light: {
        primary: '#E60F73',
        secondary: '#534F50',
        accent: '#F9BA48',
        error: '#B30C5A',
        warning: '#ff9800',
        info: '#03a9f4',
        success: '#4caf50',
      },
    },
  },
  breakpoint: {
    sm: 576,
    md: 920,
    lg: 992,
    scrollBarWidth: 24,
  },
};

Vue.use(Vuetify);

export default new Vuetify(opts);