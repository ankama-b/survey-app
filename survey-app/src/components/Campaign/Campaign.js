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
