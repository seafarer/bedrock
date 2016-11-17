set :application, 'SITENAME'
set :repo_url, 'git@bitbucket.org:develody/REPO.git'

set :wp_user, "admin" # The admin username
set :wp_email, "colin@studiotaraz.com" # The admin email address
set :wp_sitename, :application # The site title
set :wp_localurl, "http://#{application}.loc" # Your local environment URL

#restart php after deploy
namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "sudo service php7.0-fpm reload"
    end
  end
end

# The above restart task is not run by default
# Uncomment the following line to run it on deploys if needed
after 'deploy:publishing', 'deploy:restart'

set :linked_files, %w{.env}
set :linked_dirs, %w{web/app/uploads}