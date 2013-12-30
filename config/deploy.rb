require "bundler/capistrano"
require "rvm/capistrano"
require "erb"

#set :default_environment, {
# 'PATH' => "/usr/local/bin:/bin:/usr/bin:/bin:/<ruby-dir>/bin",
# 'GEM_HOME' => '<ruby-dir>/lib/ruby/gems/1.8',
# 'GEM_PATH' => '<ruby-dir>lib/ruby/gems/1.8',
# 'BUNDLE_PATH' => '<ruby-dir>/lib/ruby/gems/1.8/gems'
#}


set(:rvm_type) { :system }
set(:ruby_version) { '1.9.3p429' }
set(:user) { 'mashpy' }
set(:rvm_ruby_string) { "1.9.3p429" }
set(:rvm_path) { "/usr/local/rvm" }

set :repository, "https://github.com/Mashpy/esl_jobs.git"
set :application, "162.243.21.171"
set :deploy_via, :remote_cache #:export | :remote_cache
set :deploy_to, "/home/#{user}/apps/#{application}"
set :rails_env, "production --trace"
set :rake, 'bundle exec rake'

set :scm, 'git'
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#the user of the server which will run commands on server
ssh_options[:port] = 22
ssh_options[:username] = 'root'
ssh_options[:host_key] = 'ssh-dss'
ssh_options[:paranoid] = false
set :use_sudo, true


role :web, "162.243.21.171" # Your HTTP server, Apache/etc
role :app, "162.243.21.171" # This may be the same as your `Web` server
role :db, "162.243.21.171", :primary => true # This is where Rails migrations will run
role :db, "162.243.21.171"


#before 'deploy:update', :create_log_share

#after "deploy:update", :uservm

after "deploy:setup", :"deploy:create_shared_files_and_directories"

after "deploy:symlink", :link_shared_files
after "deploy:symlink", :"deploy:install_bundle"
after "deploy:symlink", :"deploy:restart"

task :create_log_share do
  run "mkdir -p #{shared_path}/log"
end

  task :uservm, :roles => :app do
    run "rvm use 1.9.3p429 --default"
  end

task :link_shared_files, :roles => :app do
  run "rm -rf #{current_path}/.bundle; ln -s #{shared_path}/config/.bundle #{current_path}/.bundle"
  run "rm #{current_path}/vendor/bundle; ln -s #{shared_path}/bundle #{current_path}/vendor/bundle"
  run "rm -rf #{current_path}/tmp/sockets; ln -s #{shared_path}/sockets #{current_path}/tmp/sockets"
  run "rm -rf #{current_path}/public/uploads; ln -s #{shared_path}/uploads #{current_path}/public/uploads"
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end

  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end

  task :install_bundle, :roles => :app do
    run "cd #{current_path}; rvmsudo bundle install"
  end

  task :create_shared_files_and_directories, :role => :app do
    run "mkdir -p #{shared_path}/sockets"
    run "mkdir -p #{shared_path}/config/.bundle"
    run "mkdir -p #{shared_path}/bundle"
    run "mkdir -p #{shared_path}/uploads"
    run "touch #{shared_path}/config/.bundle/config"

    run "echo '---' >> #{shared_path}/config/.bundle/config"
    run "echo 'BUNDLE_PATH: vendor/bundle' >> #{shared_path}/config/.bundle/config"
    run "echo \"BUNDLE_DISABLE_SHARED_GEMS: '1'\" >> #{shared_path}/config/.bundle/config"
  end
end