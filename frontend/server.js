const express = require('express');
const path = require('path');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();

// Middleware to set X-Node-ID header
app.use((req, res, next) => {
  const nodeId = process.env.NODE_ID || 'unknown';
  res.setHeader('X-Node-ID', nodeId);
  next();
});

// Proxy API requests to the API server
app.use('/api', createProxyMiddleware({
  target: 'http://16.171.225.235:5000',
  changeOrigin: true
}));

// Serve static files from the React build
app.use(express.static(path.join(__dirname, 'build')));

// Serve index.html for all other routes
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

const PORT = 3002;
app.listen(PORT, () => {
  console.log(`Frontend server running on port ${PORT}`);
});
