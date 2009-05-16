set :application, "gravatar"
set :repository,  "git://github.com/aussiegeek/gravatar.git"


set :deploy_to, "/home/gravatar"

set :use_sudo, false
set :branch, 'master'
set :user, 'gravatar'
set :scm, :git
role :app, "hax.local"
role :web, "hax.local"
role :db,  "hax.local", :primary => true

set :keep_releases, 4


namespace :deploy do
  task :start, :roles => :app do
  end

  task :stop, :roles => :app do
  end

  task :restart, :roles => :app do
    run "touch #{release_path}/tmp/restart.txt"
  end
end

desc "Link in the production database.yml" 
task :after_update_code do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml" 
end

after :deploy, "deploy:cleanup"
