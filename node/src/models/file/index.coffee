fs = require 'fs'


class FileModel
    
    constructor: (@db) ->
    
    
    # find multiple files
    
    find: (spec, callback) ->
        
        collection = @db.collection 'files.files'
        
        collection.find(spec).toArray (err, values) ->
            callback err, values
    
    
    # save file to gridfs
    
    create: (file) ->
        
        spec =
            filename: file.name
            contentType: file.type
        
        gridfs = @db.gridfs 'files'        
        gridfs_file = gridfs.create spec
        gridfs_stream = gridfs_file.writeStream()
        
        # pipe local file to gridfs
        
        fs.createReadStream(file.path).pipe gridfs_stream
        gridfs_file.save()


# export router instance

module.exports = FileModel