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
