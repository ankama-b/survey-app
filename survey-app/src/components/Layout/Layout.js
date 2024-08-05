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
