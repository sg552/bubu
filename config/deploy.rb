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
set :user, "sg552"
set :password, "sss333"
#ssh_options[:keys] = %w{connectingbj.pem}

namespace :deploy do
  set :use_sudo, true
  task :restart do
    run "apache2ctl restart"
    #run "touch tmp/restart.txt"
  end
  task :start do
    run "apache2ctl start"
  end
  task :stop do
    run "apache2ctl stop"
  end
end

# store the database.yml and other configuration files in the
# common shared directory and then copy them in to the application
desc "Copy database.yml to release_path"
task :cp_database_yml do
  puts "executing my customized command: "
  puts "cp -r #{shared_path}/config/* #{release_path}/config/"
  run "cp -r #{shared_path}/config/* #{release_path}/config/"
end

before "deploy:assets:symlink", :cp_database_yml

#before "deploy", mongrel::stop
