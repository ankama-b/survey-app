#!/bin/bash

# Exit on error
set -e

# Define project name
PROJECT_NAME="survey-app"

# Create React App
npx create-react-app $PROJECT_NAME
cd $PROJECT_NAME

# Install Dependencies
npm install @mui/material @emotion/react @emotion/styled @mui/icons-material react-redux redux redux-saga redux-form redux-logger react-router-dom

# Create directory structure
mkdir -p src/components/{Admin,Auth,Dashboard,Layout,Profile,Campaign} src/redux/{actions,reducers,sagas} src/utils

# Create store.js
cat <<EOT > src/redux/store.js
import { createStore, applyMiddleware } from 'redux';
import createSagaMiddleware from 'redux-saga';
import rootReducer from './reducers';
import rootSaga from './sagas';

const sagaMiddleware = createSagaMiddleware();

const store = createStore(
  rootReducer,
  applyMiddleware(sagaMiddleware)
);

sagaMiddleware.run(rootSaga);

export default store;
EOT

# Create index.js
cat <<EOT > src/index.js
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import store from './redux/store';
import App from './App';

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);
EOT

# Create App.js
cat <<EOT > src/App.js
import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Layout from './components/Layout/Layout';
import Login from './components/Auth/Login';
import Register from './components/Auth/Register';
import ForgotPassword from './components/Auth/ForgotPassword';
import Profile from './components/Profile/Profile';
import Admin from './components/Admin/Admin';
import Campaign from './components/Campaign/Campaign';
import Dashboard from './components/Dashboard/Dashboard';

const App = () => (
  <Router>
    <Layout>
      <Switch>
        <Route path="/login" component={Login} />
        <Route path="/register" component={Register} />
        <Route path="/forgot-password" component={ForgotPassword} />
        <Route path="/profile" component={Profile} />
        <Route path="/admin" component={Admin} />
        <Route path="/campaign" component={Campaign} />
        <Route path="/dashboard" component={Dashboard} />
        <Route path="/" exact component={Dashboard} />
      </Switch>
    </Layout>
  </Router>
);

export default App;
EOT

# Create Layout component
cat <<EOT > src/components/Layout/Layout.js
import React from 'react';
import { AppBar, Toolbar, Typography, Container } from '@mui/material';

const Layout = ({ children }) => (
  <div>
    <AppBar position="static">
      <Toolbar>
        <Typography variant="h6">Survey App</Typography>
      </Toolbar>
    </AppBar>
    <Container>
      {children}
    </Container>
  </div>
);

export default Layout;
EOT

# Create Login component
cat <<EOT > src/components/Auth/Login.js
import React from 'react';
import { TextField, Button } from '@mui/material';

const Login = () => {
  const handleSubmit = (event) => {
    event.preventDefault();
    // Handle login
  };

  return (
    <form onSubmit={handleSubmit}>
      <TextField label="Email" type="email" required fullWidth />
      <TextField label="Password" type="password" required fullWidth />
      <Button type="submit" variant="contained" color="primary">Login</Button>
    </form>
  );
};

export default Login;
EOT

# Create Register component
cat <<EOT > src/components/Auth/Register.js
import React from 'react';
import { TextField, Button } from '@mui/material';

const Register = () => {
  const handleSubmit = (event) => {
    event.preventDefault();
    // Handle registration
  };

  return (
    <form onSubmit={handleSubmit}>
      <TextField label="Name" required fullWidth />
      <TextField label="Email" type="email" required fullWidth />
      <TextField label="Password" type="password" required fullWidth />
      <Button type="submit" variant="contained" color="primary">Register</Button>
    </form>
  );
};

export default Register;
EOT

# Create ForgotPassword component
cat <<EOT > src/components/Auth/ForgotPassword.js
import React from 'react';
import { TextField, Button } from '@mui/material';

const ForgotPassword = () => {
  const handleSubmit = (event) => {
    event.preventDefault();
    // Handle forgot password
  };

  return (
    <form onSubmit={handleSubmit}>
      <TextField label="Email" type="email" required fullWidth />
      <Button type="submit" variant="contained" color="primary">Reset Password</Button>
    </form>
  );
};

export default ForgotPassword;
EOT

# Create Profile component
cat <<EOT > src/components/Profile/Profile.js
import React from 'react';
import { TextField, Button } from '@mui/material';

const Profile = () => {
  const handleSubmit = (event) => {
    event.preventDefault();
    // Handle profile update
  };

  return (
    <form onSubmit={handleSubmit}>
      <TextField label="Name" required fullWidth />
      <TextField label="Email" type="email" required fullWidth />
      <Button type="submit" variant="contained" color="primary">Update Profile</Button>
    </form>
  );
};

export default Profile;
EOT

# Create Admin component
cat <<EOT > src/components/Admin/Admin.js
import React from 'react';
import { Table, TableBody, TableCell, TableHead, TableRow, Button } from '@mui/material';

const Admin = () => {
  const users = []; // Replace with actual data

  return (
    <div>
      <h2>Manage Users</h2>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>Name</TableCell>
            <TableCell>Email</TableCell>
            <TableCell>Actions</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {users.map((user) => (
            <TableRow key={user.id}>
              <TableCell>{user.name}</TableCell>
              <TableCell>{user.email}</TableCell>
              <TableCell>
                <Button variant="contained" color="primary">Edit</Button>
                <Button variant="contained" color="secondary">Delete</Button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
};

export default Admin;
EOT

# Create Campaign component
cat <<EOT > src/components/Campaign/Campaign.js
import React from 'react';
import { TextField, Button, Typography } from '@mui/material';

const Campaign = () => {
  const handleSubmit = (event) => {
    event.preventDefault();
    // Handle campaign creation
  };

  return (
    <form onSubmit={handleSubmit}>
      <Typography variant="h6">Create Campaign</Typography>
      <TextField label="Campaign Name" required fullWidth />
      <TextField label="Question" required fullWidth />
      <TextField label="Option 1" required fullWidth />
      <TextField label="Option 2" required fullWidth />
      <Button type="submit" variant="contained" color="primary">Create Campaign</Button>
    </form>
  );
};

export default Campaign;
EOT

# Create Dashboard component
cat <<EOT > src/components/Dashboard/Dashboard.js
import React from 'react';
import { Card, CardContent, Typography } from '@mui/material';

const Dashboard = () => {
  const campaigns = []; // Replace with actual data

  return (
    <div>
      <h2>Dashboard</h2>
      {campaigns.map((campaign) => (
        <Card key={campaign.id}>
          <CardContent>
            <Typography variant="h5">{campaign.name}</Typography>
            <Typography variant="body2">{campaign.result}</Typography>
          </CardContent>
        </Card>
      ))}
    </div>
  );
};

export default Dashboard;
EOT

# Create validation utility
cat <<EOT > src/utils/validations.js
export const required = (value) => (value ? undefined : 'Required');

export const email = (value) =>
  value && !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(value)
    ? 'Invalid email address'
    : undefined;
EOT

# Create actions
cat <<EOT > src/redux/actions/authActions.js
export const login = (credentials) => ({
  type: 'LOGIN_REQUEST',
  payload: credentials
});

export const register = (userInfo) => ({
  type: 'REGISTER_REQUEST',
  payload: userInfo
});
EOT

# Create reducers
cat <<EOT > src/redux/reducers/authReducer.js
const initialState = {
  user: null,
  loading: false,
  error: null
};

const authReducer = (state = initialState, action) => {
  switch (action.type) {
    case 'LOGIN_REQUEST':
    case 'REGISTER_REQUEST':
      return { ...state, loading: true };
    case 'LOGIN_SUCCESS':
    case 'REGISTER_SUCCESS':
      return { ...state, loading: false, user: action.payload };
    case 'LOGIN_FAILURE':
    case 'REGISTER_FAILURE':
      return { ...state, loading: false, error: action.payload };
    default:
      return state;
  }
};

export default authReducer;
EOT

# Create rootReducer
cat <<EOT > src/redux/reducers/index.js
import { combineReducers } from 'redux';
import authReducer from './authReducer';

const rootReducer = combineReducers({
  auth: authReducer,
  // Add other reducers here
});

export default rootReducer;
EOT

# Create sagas
cat <<EOT > src/redux/sagas/authSaga.js
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
EOT

# Create rootSaga
cat <<EOT > src/redux/sagas/index.js
import { all } from 'redux-saga/effects';
import authSaga from './authSaga';

export default function* rootSaga() {
  yield all([
    authSaga(),
    // Add other sagas here
  ]);
}
EOT

# Create auth API
cat <<EOT > src/redux/api/authApi.js
export const login = async (credentials) => {
  // Call API to login
  return { id: 1, name: 'John Doe', email: 'john@example.com' }; // Mock response
};

export const register = async (userInfo) => {
  // Call API to register
  return { id: 1, name: 'John Doe', email: 'john@example.com' }; // Mock response
};
EOT

echo "Project setup is complete. Run 'npm start' to start the development server."
