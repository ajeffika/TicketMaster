export default {
  isAdminAuthenticated: state => !!state.token.accessToken && state.signedIn && state.auth.user.role === 'admin',
  isAuthenticated: state => !!state.token.accessToken && state.signedIn,
  // canCreateIncidents: state => state.user.permissions.can_create_incidents && !!state.token.accessToken,
  authStatus: state => state.signedIn,
  user: state => state.user,
  token: state => state.token,
};