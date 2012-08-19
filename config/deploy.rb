require 'capistrano'
require 'capistrano-vexxhost'
require 'bundler/capistrano'

# Account Settings
set :user, "set2001"
set :password, "msg2012"
set :domain, "mysportsgambler.com"
set :mount_path, "/"
set :application, "mysportsgambler"

set :scm, :git
set :repository, "git@github.com:stevetong83/mysportsgambler.git"