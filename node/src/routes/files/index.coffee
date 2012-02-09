models = require '../../models'


class FilesRouter
    
    
    # save application reference, map request routes
    
    constructor: (@app) ->
        
        @app.get '/file', @list
        @app.post '/file', @upload
    
    
    # file list view
    
    list: (req, res) ->
        
        models.file.find {}, (err, values) ->

            context =
                locals:
                    files: values
            
            res.render 'files/list', context
    
    
    # file upload view
    
    upload: (req, res) ->

        
        # save file to database
        
        models.file.create(req.files.upload)
        
        res.redirect '/file'
        


# export router instance

module.exports = FilesRouter