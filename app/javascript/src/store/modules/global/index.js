import mutations from './mutations';
import getters from './getters';

const state = {
  snack: {
    type: '',
    message: '',
  },
};

export default {
  namespaced: true,
  state,
  mutations,
  getters,
};