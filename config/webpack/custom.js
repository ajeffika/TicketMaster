const path = require('path');

module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '..', '..', 'app/javascript/src'),
      'vue$': 'vue/dist/vue.esm.js',
      'views': path.resolve(__dirname, '..', '..', 'app/javascript/src/views'),
      '@components': path.resolve(__dirname, '..', '..', 'app/javascript/src/components'),
      '@helpers': path.resolve(__dirname, '..', '..', 'app/javascript/src/helpers'),
      '@store': path.resolve(__dirname, '..', '..', 'app/javascript/src/store'),
      '@images': path.resolve(__dirname, '..', '..', 'app/javascript/src/assets/images'),
    },
  },
};