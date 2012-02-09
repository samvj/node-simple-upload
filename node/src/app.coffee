express = require 'express'
hogan   = require 'express-hogan.js'


# initialize the application server
app = module.exports = express.createServer()


# configure template engine
app.set 'view engine', 'html'
app.set 'views', "#{ __dirname }/views"
app.register '.html', hogan


# configure the application server
app.configure ->
    app.use express.bodyParser()
    app.use express.cookieParser()
    app.use express.methodOverride()
    app.use express.errorHandler
        dumpExceptions: true
        showStack: true
    app.use app.router


# instantiate route handlers
routes = (require './routes')(app)


# listen for incoming requests
app.listen '/tmp/node-simple-upload.sock'