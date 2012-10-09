default_run_options[:pty] = true
set :use_sudo, false

set :repository, "git@github.com:rafapolo/webdocgraffiti.git"  # Your clone URL
set :scm, "git"
set :user, "webdocgr"  # The server's user for deploys
set :scm_passphrase, "Euu44ql94R"  # The deploy user's password

set :application, "webdocgraffiti"
set :branch, "master"
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache

role :web, "webdocgraffiti.com.br"
role :app, "webdocgraffiti.com.br"
set :deploy_to, "/home/#{user}/#{application}" 


task :after_update_code, :roles => [:web, :db, :app] do
  run "chmod 755 #{release_path}/public"
end

namespace :deploy do
  desc "restart passenger"
  task :restart do
    passenger::restart
  end
end

namespace :passenger do
  desc "Restart dispatchers"
  task :restart do
  	#run "mv #{current_path}/db/webdoc.dev.sqlite3 #{current_path}/db/webdoc.sqlite3"
    run "cd #{current_path}; bundle install --path=vendor/bundle"
    run "touch #{current_path}/tmp/restart.txt"
  end
end