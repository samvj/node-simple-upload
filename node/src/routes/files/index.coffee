models = require '../../models'


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

        
        # save file to database
        
        models.file.create(req.files.upload)
        
        res.redirect '/file'
        


# export router instance

module.exports = FilesRouter