mongolian = require 'mongolian'


# define the database connection

db = new mongolian 'mongo://localhost/litigance'


# export the db object modules

module.exports =
    file: new (require './file') db