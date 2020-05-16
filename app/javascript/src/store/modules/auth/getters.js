export default {
  isAuthenticated: state => !!state.token.accessToken && state.signedIn,
  canCreateEntries: state => state.user.permissions.can_create_entries && !!state.token.accessToken,
  authStatus: state => state.signedIn,
  user: state => state.user,
  token: state => state.token,
};