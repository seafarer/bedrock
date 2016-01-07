set :stage, :staging
set :stage_url, "http://dev.url"
server '192.xxx.xxx.xxx', user: 'username', roles: %w{web app db}
set :deploy_to, "/home/SITENAME/public_html/SITE.dev"
set :tmp_dir, "/home/SITENAME/tmp"

# Setting for wpcli DB replacement
set :wpcli_remote_url, "http://SITE.dev.wps.host"
set :wpcli_local_url, "http://SITE.dev"

set :linked_files, %w{.env web/.htaccess} #  added this so our .htaccess file wouldn't be overwritten every deploy

SSHKit.config.command_map[:composer] = "/usr/local/bin/composer.phar"

fetch(:default_env).merge!(wp_env: :staging)