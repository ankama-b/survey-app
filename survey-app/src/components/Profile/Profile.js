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
