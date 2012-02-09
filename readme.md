# Overview

Just a simple node.js application that demonstrates HTTP-based file uploads. The code is written in CoffeeScript. Files are stored using MongoDB's GridFS.

# Building

Build these components by executing `coffeescript --compile --output lib/ src/`. I also create a manual sym-link in the created lib directory that points to the views in the src directory. `cd lib; ln -s ../src/views .`

# Running

I run this behind Nginx, so you'll have to create an nginx setup for that, or change the server binding to something other than a local unix socket.