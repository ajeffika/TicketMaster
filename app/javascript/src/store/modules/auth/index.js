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
    role: '',
    groupIds: '',
  },
};

export default {
  namespaced: true,
  state,
  actions,
  getters,
  mutations,
};
