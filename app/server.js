const http = require('http')

const app = require('./app')

// Normalize a port into a number, string, or false.
function normalizePort (val) {
  const port = parseInt(val, 10)
  if (isNaN(port)) {
    return val  // named pipe
  }
  if (port >= 0) {
    return port  // port number
  }
  return false
}

// Event listener for HTTP server "error" event.
function onError (error) {
  // Handle specific listen errors with friendly messages.
  if (error.syscall === 'listen') {
    const bind = typeof port === 'string' ? `Pipe ${port}` : `Port ${port}`
    if (error.code === 'EACCES') {
      console.error(`Error: ${bind} requires elevated privileges.`)
    }
    if (error.code === 'EADDRINUSE') {
      console.error(`Error: ${bind} is already in use.`)
    }
  }
  throw error
}

// Event listener for HTTP server "listening" event.
function onListening () {
  const addr = this.address()
  const bind = typeof addr === 'string' ? `pipe ${addr}` : `port ${addr.port}`
  console.log(`Listening on ${bind}`)
}

const port = normalizePort(process.env.PORT || '3000')

http.createServer(app)
  .listen(port)
  .on('error', onError)
  .on('listening', onListening)
