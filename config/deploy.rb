`ssh-add`
# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "elong_hotel"
set :repo_url, "git@github.com:shnnui/hotel.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/hotel"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
#set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

#set :default_environment, {
#  'PATH'         => "/usr/local/rvm/gems/ruby-2.5.1/bin:/usr/local/rvm/gems/ruby-2.5.1@global/bin:/usr/local/rvm/rubies/ruby-2.5.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/rvm/bin",
#  'RUBY_VERSION' => 'ruby 2.5.1',
#  'GEM_HOME'     => '~/.rvm/gems/ruby 2.5.1',
#  'GEM_PATH'     => '/.rvm/gems/ruby 2.5.1',
#  'BUNDLE_PATH'  => '/.rvm/gems/ruby 2.5.1'  # If you are using bundler.
#}
