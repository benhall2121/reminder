


server "benerino.com", :app, :web, :db, :primary => true

set :user, 'demo'
set :keep_releases, 3 
set :repository,  "git@github.com:benhall2121/reminder.git" # replace neerajdotname with your github username
set :use_sudo, false
set :scm, :git
set :deploy_via, :copy

# this will make sure that capistrano checks out the submodules if any
set :git_enable_submodules, 1

set :application, 'reminder' # replace gitlearn with your application name
set (:deploy_to) { "/home/#{user}/apps/#{application}" }

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

ssh_options[:port] = 30000

