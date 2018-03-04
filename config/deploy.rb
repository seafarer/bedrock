set :repo_url, 'git@bitbucket.org:develody/REPO.git'

set :wp_user, "Develody" # The admin username
set :wp_email, "colin@studiotaraz.com" # The admin email address
set :wp_sitename, :application # The site title
set :wp_localurl, "http://SITE.loc" # Your local environment URL
set :wpcli_local_url, "http://SITE.loc" # Your local environment URL

def theme_path(release_path) "#{release_path}/web/app/themes/SITE" end

SSHKit.config.command_map[:composer] = "/usr/local/bin/composer"
SSHKit.config.command_map[:yarn] =  "/usr/bin/yarn"

namespace :deploy do
    desc 'Composer Theme Dependencies'
    task :composer_theme_dependencies do
        on roles(:app) do
              within theme_path(release_path) do
                execute :composer, "install"
              end;
        end
    end
end
before 'deploy:updated', 'deploy:composer_theme_dependencies'

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