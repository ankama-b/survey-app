import React, { Fragment } from "react";
import { BrowserRouter, Route,Routes } from "react-router-dom";
import Login from "./components/Auth/Login";
import Register from "./components/Auth/Register";
import ForgotPassword from "./components/Auth/ForgotPassword";
import Profile from "./components/Profile/Profile";
import Admin from "./components/Admin/Admin";
import Campaign from "./components/Campaign/Campaign";
import Dashboard from "./components/Dashboard/Dashboard";
import PrivateRoute from "./components/Auth/PrivateRoute";

const App = () => (
  <>
  <BrowserRouter>     
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/forgot-password" element={<ForgotPassword />} />
          <Route path="/profile" element={<PrivateRoute path="/profile" component={Profile} />} />       
          <Route path="/admin" element={<PrivateRoute path="/admin" component={Admin} />} />            
          <Route path="/campaign" element={ <PrivateRoute path="/campaign" component={Campaign} />} />            
          <Route path="/dashboard" element={ <PrivateRoute path="/dashboard" component={Dashboard} />} />           
          <Route path="/" element={<PrivateRoute path="/" exact component={Dashboard} />} />           
        </Routes>    
  </BrowserRouter>
  </>
);

export default App;
