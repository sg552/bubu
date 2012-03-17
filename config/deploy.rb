require "bundler/capistrano"
load 'deploy/assets'

set :application, "bubu"
set :repository, "git://github.com/sg552/bubu.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "114.80.200.241"                          # Your HTTP server, Apache/etc
role :app, "114.80.200.241"                          # This may be the same as your `Web` server
role :db,  "114.80.200.241", :primary => true # This is where Rails migrations will run

set :deploy_to, "~/bubu"
set :user, "root"
set :password, "blueSKY$$88"
#ssh_options[:keys] = %w{connectingbj.pem}

namespace :deploy do
  task :restart do
    apache2ctl restart
  end
  task :start do
    apache2ctl start
  end
  task :stop do
    apache2ctl stop
  end
end

# store the database.yml and other configuration files in the
# common shared directory and then copy them in to the application
desc "Copy database.yml to release_path"
task :cp_database_yml do
  run "cp -r #{shared_path}/config/* #{release_path}/config/"
end

before "deploy:symlink", :cp_database_yml

#before "deploy", mongrel::stop
