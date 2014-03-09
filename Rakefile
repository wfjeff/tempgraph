task :environment do
  ENV["TEMPGRAPH_ENV"] ||= "development"
  require_relative 'config/environment'
end

namespace :db do
  task :migrate => :environment do
    Dir[File.join(File.dirname(__FILE__), "db/migrations", "*.rb")].each do |f| 
      require f
      migration = Kernel.const_get(f.split("/").last.split(".rb").first.gsub(/\d+/, "").split("_").collect{|w| w.strip.capitalize}.join())
      migration.migrate(:up)
    end
  end

  task :reset => :environment do 
    DB.tables.each do |table|
      DB.execute("DROP TABLE #{table}")
    end
  end
end

task :console => :environment do
  Pry.start
end

desc "get temperature from twine"
task :get_reading => :environment do
  twine = Twine.find_by(name: "twine1")
  twine.get_reading
  twine.save
end