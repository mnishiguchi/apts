namespace :db do
  desc "Seed database with fake data"
  task :seed => :environment do

    invoke_tasks [
      "db:migrate:reset",
      "db:seed_users",
      "db:seed_feed_sources",
      "db:import_feeds"
    ]
  end
end

def invoke_tasks(rake_tasks)
  rake_tasks.each { |rake_task| Rake::Task[rake_task].invoke }
end
