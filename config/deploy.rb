set :application, 'SITENAME'
set :repo_url, 'git@bitbucket.org:develody/REPO.git'

set :wp_user, "USER" # The admin username
set :wp_email, "USER EMAIL" # The admin email address
set :wp_sitename, "SITE TITLE" # The site title
set :wp_localurl, "http://local.url" # Your local environment URL

# Use :debug for more verbose output when troubleshooting
set :log_level, :info

# Apache users with .htaccess files:
# it needs to be added to linked_files so it persists across deploys:
# set :linked_files, fetch(:linked_files, []).push('.env', 'web/.htaccess')
set :linked_files,  fetch(:linked_files, []).push('.env web/.htaccess')
set :linked_files, fetch(:linked_files, []).push('.env')
set :linked_dirs, fetch(:linked_dirs, []).push('web/app/uploads')