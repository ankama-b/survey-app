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
