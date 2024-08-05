import { call, put, takeLatest } from 'redux-saga/effects';
import { login, register } from '../api/authApi';

function* handleLogin(action) {
  try {
    const user = yield call(login, action.payload);
    yield put({ type: 'LOGIN_SUCCESS', payload: user });
  } catch (error) {
    yield put({ type: 'LOGIN_FAILURE', payload: error.message });
  }
}

function* handleRegister(action) {
  try {
    const user = yield call(register, action.payload);
    yield put({ type: 'REGISTER_SUCCESS', payload: user });
  } catch (error) {
    yield put({ type: 'REGISTER_FAILURE', payload: error.message });
  }
}

export default function* authSaga() {
  yield takeLatest('LOGIN_REQUEST', handleLogin);
  yield takeLatest('REGISTER_REQUEST', handleRegister);
}
