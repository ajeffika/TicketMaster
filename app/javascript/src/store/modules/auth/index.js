import actions from './actions';
import getters from './getters';
import mutations from './mutations';

const state = {
  signedIn: false,
  isLoading: false,
  token: {
    accessToken: '',
    client: '',
    uid: '',
  },
  user: {
    id: '',
    email: '',
    username: '',
    firstName: '',
    lastName: '',
    permissions: {},
    bandId: ''
  },
};

export default {
  namespaced: true,
  state,
  actions,
  getters,
  mutations,
};
