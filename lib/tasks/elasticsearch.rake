require 'elasticsearch/rails/tasks/import'

# To run: rake es:run
# lib/tasks/pull_prod_db.rake

namespace :es do
    desc 'Run Es'

    task :run do
      puts 'Start import...'
      system "bundle exec rake environment elasticsearch:import:model CLASS='Story'"
      puts 'Done'
    end
  end