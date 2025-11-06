module.exports.handler = async (event) => {
  console.log('Large Lambda function executed');
  
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Large Lambda (>250MB) executed successfully!',
      timestamp: new Date().toISOString()
    }),
  };
};