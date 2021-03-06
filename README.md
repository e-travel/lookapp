## LookApp

Instruction to setup the e-Travel dns lookup service

### Requirements

* Ruby version: 2.1.x
* Bundler gem (http://bundler.io)

### Environment configuration

* The environmental variable `SECRET_KEY_BASE` should be set with a big random value (use the same every time)

### Application server

* run `bundle install` in the application folder to install gem dependencies
* compile assets with `bundle exec rake assets:precompile RAILS_ENV=production`
* run the server with `bundle exec rails server -e production`

### Web server

* run a web server to serve port 3000 externally
* to serve the application properly the web server should first try to find matching static files in the `public` folder, else proxy to the application server
