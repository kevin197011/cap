# Copyright (c) 2023 kk
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

desc 'default task'
task :default do
  sh 'cap devops devops:doDeploy'
end

desc 'push task'
task :push do
  sh 'git add .'
  sh 'git commit -m "update."'
  sh 'git push -u origin main'
end
