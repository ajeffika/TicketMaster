export default {
  list: state => state.list,
  findIncident: state => (id) => state.list.find(incident => incident.id === id),
  meta: state => state.meta,
  getCurrentIncident: state => state.record,
  recordsAreLoading: state => state.recordsAreLoading
}