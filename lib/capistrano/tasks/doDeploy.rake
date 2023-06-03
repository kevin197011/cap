# Copyright (c) 2023 kk
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

desc 'Devops namespace'
namespace :devops do
  script_name = 't.sh'

  desc 'doDeploy...'
  task :doDeploy do
    on roles(:all) do |host|
      info "Host #{host} deploy..."
      # upload files
      execute 'sudo rm -rf /tmp/nginx-1.25.0.tar.gz'
      upload! 'resources/files/nginx-1.25.0.tar.gz', '/tmp/'

      # upload scripts then execute
      upload! "resources/scripts/#{script_name}", "/tmp/#{script_name}"
      execute :sudo, "bash /tmp/#{script_name} && rm -rf /tmp/#{script_name}"

      # upload erb config files
      upload_erb 'resources/templates/nginx.conf.erb', '/tmp/nginx.conf'
      execute :sudo, '/bin/cp /tmp/nginx.conf /etc/nginx/nginx.conf'
      execute :sudo, 'systemctl restart nginx'
      info "Host #{host} deploy successed!"
    end
  end
end
