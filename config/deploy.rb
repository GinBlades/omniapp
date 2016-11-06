require "mina/bundler"
require "mina/rails"
require "mina/git"
require "mina/rbenv" # for rbenv support. (http://rbenv.org)
require "mina/whenever"
# require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, "dende"
set :repository, "git@github.com:GinBlades/omniapp.git"

# use `mina deploy` for staging OR mina deploy to=production
case ENV["to"]
when "production"
  set :deploy_to, "/home/deploy/sites/production/omniapp"
  set :branch, "master"
  set :rails_env, "production"
else
  set :deploy_to, "/home/deploy/sites/staging/omniapp"
  set :branch, "master"
  set :rails_env, "staging"
end

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_dirs, ["log", "public/uploads"]
set :shared_files, ["config/database.yml", "config/secrets.yml"]

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

set :bundle_path, "~/bundle/#{RUBY_VERSION}"
# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task setup: :environment do
  command %(mkdir -p "#{fetch(:shared_path)}/log")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/log")

  command %(mkdir -p "#{fetch(:shared_path)}/config")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/config")

  command %(mkdir -p "#{fetch(:shared_path)}/public/uploads")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/public/uploads")

  command %(touch "#{fetch(:shared_path)}/config/database.yml")
  command %(echo "-----> Be sure to edit '#{fetch(:shared_path)}/config/database.yml'.")

  command %(touch "#{fetch(:shared_path)}/config/secrets.yml")
  command %(echo "-----> Be sure to edit '#{fetch(:shared_path)}/config/secrets.yml'.")
end

desc "Deploys the current version to the server."
task deploy: :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'whenever:update'
    invoke :'deploy:cleanup'

    on :launch do
      command "mkdir -p #{fetch(:current_path)}/tmp/"
      command "touch #{fetch(:current_path)}/tmp/restart.txt"
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers
