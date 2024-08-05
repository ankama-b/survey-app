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
