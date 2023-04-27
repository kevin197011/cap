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
      info "=> #{host}..."
      upload! "scripts/#{script_name}", "/tmp/#{script_name}"
      execute "sudo bash /tmp/#{script_name} && rm -rf /tmp/#{script_name}"
      info "<= #{host}"
    end
  end
end
