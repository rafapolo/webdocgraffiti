default_run_options[:pty] = true
set :repository, "git@github.com:rafapolo/webdocgraffiti.git"  # Your clone URL
set :scm, "git"
set :user, "webdocgr"  # The server's user for deploys
set :scm_passphrase, "Euu44ql94R"  # The deploy user's password

set :application, "webdocgraffiti"
set :branch, "master"
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end