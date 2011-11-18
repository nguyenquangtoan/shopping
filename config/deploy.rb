#
set :user, 'root'
set :domain, 'spree.dqn.vn'
set :application, 'spree'

#
default_run_options[:pty] = true
set :repository, "git@github.com:nguyenquangtoan/shopping.git"
set :deploy_to, "/home/#{user}/#{domain}"
set :scm_passphrase, "zxcvbn"

#
role :app, domain
role :web, domain
role :db, domain, :primary => true


# you might need to set this if you aren't seeing password prompts


#As Capistrano executes in a non-interactive mode and therefore doesn't cause
#any of your shell profile scripts to be run, the following might be needed
#if (for example) you have locally installed gems or applications. Note:
#this needs to contain the full values for the variables set, not simply
#the deltas.
#default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
#default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'

# Config for using rvm on remote server
set :default_environment, {
  'PATH' => '/root/.rvm/gems/ruby-1.9.2-p290/bin:/root/.rvm/gems/ruby-1.9.2-p290@global/bin:/root/.rvm/rubies/ruby-1.9.2-p290/bin:/root/.rvm/bin:$PATH',
  'RUBY_VERSION' => 'ruby 1.9.2',
  'GEM_HOME' => '/root/.rvm/gems/ruby-1.9.2-p290',
  'GEM_PATH' => '/root/.rvm/gems/ruby-1.9.2-p290',
  'BUNDLE_PATH' => '/root/.rvm/gems/ruby-1.9.2-p290',
}

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

after "deploy", "rvm:trust_rvmrc"

# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end

task :check_env do
  run "source .bash_profile"
  run "env"
end
#set :application, "set your application name here"
#set :repository,  "set your repository location here"

#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

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