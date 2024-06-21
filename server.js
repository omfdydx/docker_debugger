const http = require('http');
const port = process.env.PORT || 5050;
// This server will respond to all requests (regardless of path) with "hello world"
const server = http.createServer((request, response) => {
    response.setHeader('ngrok-skip-browser-warning', true);
    response.writeHead(200, {'Content-Type': 'application/json'});
    response.end(JSON.stringify({
        data: 'Hello World!',
    }));
    console.log(`Requested ${request.url}`);
});

server.listen(port);
console.log('Server is now listening on port ' + port);