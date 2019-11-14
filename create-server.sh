#! /bin/bash

cat << EOF >> server.js
var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Welcome Node.js');
}).listen(3001, "127.0.0.1");

console.log('Server running at http://127.0.0.1:3001/');

EOF