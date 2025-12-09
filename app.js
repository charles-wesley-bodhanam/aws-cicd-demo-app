const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

// Health check endpoint
app.get("/health", (req, res) => {
  res.json({
    status: "OK",
    message: "App is running via AWS CI/CD pipeline"
  });
});

// Home page
app.get("/", (req, res) => {
  res.send(`
    <h1>AWS CI/CD Pipeline Demo</h1>
    <p>This app is deployed using CodePipeline, CodeBuild, ECR, and EC2.</p>
  `);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
