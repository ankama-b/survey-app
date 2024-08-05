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
