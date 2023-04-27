# Copyright (c) 2023 kk
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT


role :app, %w[192.168.56.11]

set :ssh_options, {
  user: 'vagrant',
  keys: %w[/Users/kevin/project/vagrant/centos/.vagrant/machines/default/virtualbox/private_key],
  forward_agent: false,
  auth_methods: %w[publickey]
}
