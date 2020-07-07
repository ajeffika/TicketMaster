import actions from './actions';
import getters from './getters';
import mutations from './mutations';

const state = {
  list: [],
  meta: {
    totalPages: 1,
    currentPage: 1,
  },
  users_collection: {
    id: '',
    email: '',
    username: '',
    firstName: '',
    lastName: '',
    role: '',
    groupIds: '',
  },
  recordsAreLoading: false,
};

export default {
  namespaced: true,
  state,
  actions,
  getters,
  mutations,
};
