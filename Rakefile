# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :payment do
  `PUBLISHABLE_KEY=pk_test_nkABjmEhINPYiDKMzCp0z7yS SECRET_KEY=sk_test_Nee1hSVu4ViJhny9SySDQnKg rails s`
end
