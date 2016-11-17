set :stage, :staging
set :stage_url, "http://SITENAME.com"
server 'SITENAME or IP', user: 'SERVER', roles: %w{web app db}
set :deploy_to, "/home/SERVER/SITENAME.com"

fetch(:default_env).merge!(wp_env: :staging)