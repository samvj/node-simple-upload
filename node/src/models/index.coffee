mongolian = require 'mongolian'


# instantiate the database connection
database_connection = new mongolian 'mongo://localhost/node_simple_upload'


# export model instances
module.exports =
    file: new (require './file')(database_connection)