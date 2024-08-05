export const login = (credentials) => ({
  type: 'LOGIN_REQUEST',
  payload: credentials
});

export const register = (userInfo) => ({
  type: 'REGISTER_REQUEST',
  payload: userInfo
});
