set :stage, :production
set :stage_url, "http://www.site.com"
set :wpcli_remote_url, "http://www.site.com"
server 'SITENAME or IP', user: 'forge', roles: %w{web app db}
set :deploy_to, "/home/SERVER/SITENAME.com"

fetch(:default_env).merge!(wp_env: :production)