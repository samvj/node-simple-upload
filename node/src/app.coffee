express = require 'express'
hogan   = require 'express-hogan.js'


# initialize the application server

app = module.exports = express.createServer()


# configure the application server

app.set 'view engine', 'html'
app.set 'views', "#{ __dirname }/views"
app.register '.html', hogan

app.configure ->
    app.use express.bodyParser()
    app.use express.cookieParser()
    app.use express.methodOverride()
    app.use express.session 
        secret: 'litigance'
    app.use express.errorHandler
        dumpExceptions: true
        showStack: true
    app.use app.router


# instantiate the request router

routes = (require './routes')(app)


# listen for incoming requests

app.listen '/tmp/node-simple-upload.sock'