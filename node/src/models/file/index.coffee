
fs = require 'fs'


class FileModel
    
    
    # save db reference, file collection
    
    constructor: (db) ->
        
        @files = db.gridfs 'files'
    
    
    # save file to gridfs
    
    create: (file) ->
        
        
        # create gridfs file and stream
        
        db_file = @files.create filename: file.name, contentType: file.type
        db_stream = db_file.writeStream()
        
        
        # pipe local file to gridfs
        
        fs.createReadStream(file.path).pipe db_stream
        db_file.save()
        


# export router instance

module.exports = FileModel