# Overview

Just an example of how you might handle HTTP-based file uploads. The code is written in CoffeeScript. Files are stored using MongoDB's GridFS. I'm using Express.js, Hogan.js and Mongolian database lib.

# Building

Build these components by executing `coffeescript --compile --output lib/ src/`. I also create a manual sym-link in the created lib directory that points to the views in the src directory. `cd lib; ln -s ../src/views .`

# Running

I run this behind Nginx, so you'll have to create a setup for that, or change the server binding to something other than a local unix socket.