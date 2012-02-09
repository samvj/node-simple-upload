fs = require 'fs'


class FileModel
    
    constructor: (@db) ->
    
    
    find: (spec, callback) ->
        
        # work with the gridfs file collection
        collection = @db.collection 'fs.files'
        
        # query the collection for all of the files
        collection.find(spec).toArray (err, values) ->
            callback err, values


    create: (file) ->
        
        # format the file properties
        spec =
            filename: file.name
            contentType: file.type
        
        # create a gridfs file
        gridfs = @db.gridfs()
        gridfs_file = gridfs.create spec
        
        # obtain gridfs write stream
        gridfs_stream = gridfs_file.writeStream()
        
        # read local tmp file into gridfs
        fs.createReadStream(file.path).pipe gridfs_stream
        
        # save changes to gridfs
        gridfs_file.save()


# export model class
module.exports = FileModel