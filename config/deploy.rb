set :application, "flashcards"
set :repository, "git@github.com:prohner/flash_cards.git"  # Your clone URL

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.1.38"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.38"                          # This may be the same as your `Web` server
role :db,  "192.168.1.38", :primary => true # This is where Rails migrations will run
## role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts


default_run_options[:pty] = true  # Must be set for the password prompt

set :deploy_to, "/home/preston/Sites/flashcards"                       # from git to work
set :scm, "git"
set :user, "preston"  # The server's user for deploys
set :scm_passphrase, "YourPassword"  # The deploy user's password

set :ssh_options, { :forward_agent => true }
set :branch, "master"
set :deploy_via, :remote_cache

after "deploy:update_code","deploy:config_symlink"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :config_symlink do
    run "cp /home/preston/Sites/shared/flashcards/database.yml #{release_path}/config/database.yml"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

load 'deploy/assets'
