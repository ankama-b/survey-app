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
