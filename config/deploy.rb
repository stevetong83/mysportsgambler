require 'capistrano'
require 'capistrano-vexxhost'
require 'bundler/capistrano'

# Account Settings
set :user, "set2001"
set :password, "1benitos"
set :domain, "acct.mysportsgambler.com"
set :mount_path, "/public_html"
set :application, "mysportsgambler"

set :scm, :git
set :repository, "git@github.com:stevetong83/mysportsgambler.git"