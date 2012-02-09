models = require '../../models'


class FilesRouter
    
    constructor: (@app) ->
        
        # register route handlers
        @app.get '/file', @list
        @app.post '/file', @upload
    
    
    list: (req, res) ->
        
        # query database for all the files
        models.file.find {}, (err, values) ->
            
            # format template context
            context =
                locals:
                    files: values
            
            # render template file
            res.render 'files/list', context
    
    
    upload: (req, res) ->
        
        # save uploaded file to database
        models.file.create(req.files.upload)
        
        # redirect to file listing
        res.redirect '/file'
        


# export router class
module.exports = FilesRouter