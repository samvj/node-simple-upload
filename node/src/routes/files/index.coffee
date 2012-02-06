

class FilesRouter
    
    
    # save application reference, map request routes
    
    constructor: (@app) ->
        
        @app.get '/file', @list
        @app.post '/file', @upload
    
    
    # file list view
    
    list: (req, res) ->
        res.render 'files/list'
    
    
    # file upload view
    
    upload: (req, res) ->
        res.send 'lol'
        


# export router instance

module.exports = FilesRouter