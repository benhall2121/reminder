set :application, "reminder"

#github stuff
set :repository,  "git@github.com:benhall2121/reminder.git"
set :scm, :git
#set :scm_username, "your_github_id"
#set :scm_passphrase, "your_github_passwd"

set :use_sudo,    false
set :deploy_to,   "/home/#{user}/apps/#{application}"

#server login
set :user, "demo"

ssh_options[:forward_agent] = true

# will be different entries for app, web, db if you host them on different servers
server "benerino.com", :app, :web, :db, :primary => true

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