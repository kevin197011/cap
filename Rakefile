# frozen_string_literal: true

desc 'run task'
task :run do
  sh 'cap devops base:shell'
end

desc 'fmt task'
task :fmt do
  sh 'rubocop -A'
end

desc 'push task'
task :push do
  sh <<~EOF
    git add .
    git commit -m "update."
    git push -u origin main
  EOF
  system 'open https://github.com/kevin197011/cap'
end
