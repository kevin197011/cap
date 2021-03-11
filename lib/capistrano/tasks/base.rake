# frozen_string_literal: true

namespace :base do
  desc 'execute shell test!'
  task :shell do
    on roles(:all) do |host|
      upload! 'files/test.txt', '/tmp/test.txt'
      execute "echo 'test' >>/tmp/test.txt"
      download! '/tmp/test.txt', 'test.txt'
      execute 'systemctl start nginx'
      execute 'systemctl status nginx'

      # # shell
      # execute <<~SHELL
      #   touch /tmp/1.txt
      #   touch /tmp/2.txt
      #   touch /tmp/3.txt
      #   yum install -y nginx
      # SHELL
      # # shell
      # execute <<~SHELL
      #   df -lh
      #   ps -ef |grep sh
      # SHELL
      # debug
      info "Host #{host} (#{host.roles.to_a.join(', ')}):\t#{capture(:uptime)}"
      error 'test error!'
    end
  end
end
