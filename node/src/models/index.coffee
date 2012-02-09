mongolian = require 'mongolian'


# define the database connection

database_connection = new mongolian 'mongo://localhost/litigance'


# export the db object modules

module.exports =

    file: new (require './file')(database_connection)