# config valid only for current version of Capistrano
lock '3.6.1'

set :application, '5fpro-lita'
set :repo_url, 'git@github.com:5fpro/lita-template'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/setting.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# rbenv
set :rbenv_type, :user # or :system
set :rbenv_prefix, -> { "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec" }
set :rbenv_roles, :all # default value

namespace :deploy do
  after 'bundler:install', 'deploy:restart'

  task :restart do
    on roles(:app) do
      log = release_path.join("log/#{fetch(:stage)}.log")
      pid = release_path.join("tmp/pids/lita.pid")
      execute "if [[ -f #{pid} ]]; then kill -9 `cat #{pid}` && rm #{pid}; fi;"
      execute "cd #{release_path} && (#{fetch(:rbenv_prefix)} bundle exec lita >> #{log} 2>&1 & echo $! > #{pid})"
    end
  end
end

