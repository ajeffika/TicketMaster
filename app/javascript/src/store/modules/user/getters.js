export default {
  list: state => state.list,
  record: state => state.record,
  findUser: state => (id) => state.list.find(user => user.id === id),
  meta: state => state.meta,
  getCurrentGroup: state => state.record,
  recordsAreLoading: state => state.recordsAreLoading
}