import actions from './actions';
import getters from './getters';
import mutations from './mutations';

const state = {
  list: [],
  meta: {
    totalPages: 1,
    currentPage: 1,
  },
  record: {
    id: '',
    title: '',
    description: '',
    categoryId: '',
    userId: '',
    status: '',
    pending: '',
    groupId: '',
    attachment: '',
    number: '',
    slug: '',
    step: ''
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
