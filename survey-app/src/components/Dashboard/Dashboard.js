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
