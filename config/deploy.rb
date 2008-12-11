set :application, "atlruby.org"

set :scm, "git"
set :repository,  "git://github.com/atlruby/atlruby.org.git"
set :branch, "master"

set :deploy_to, "/var/www/apps/#{application}"

default_run_options[:pty] = true
set :ssh_options, {:forward_agent => true }
set :user, "deploy"
set :use_sudo, false

role :app, "teachcast.net"
role :web, "teachcast.net"
role :db,  "teachcast.net", :primary => true

set :deploy_via, :remote_cache

task :after_update_code do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{deploy_to}/shared/config/boot.rb #{release_path}/vendor/plugins/community_engine/engine_config/boot.rb"
  run "ln -nfs #{deploy_to}/shared/photos #{release_path}/public/photos"
end
