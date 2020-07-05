export default {
  list: state => state.list,
  findGroup: state => (id) => state.list.find(group => group.id === id),
  meta: state => state.meta,
  getCurrentGroup: state => state.record,
  recordsAreLoading: state => state.recordsAreLoading
}