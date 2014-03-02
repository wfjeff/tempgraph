require 'bundler/setup'
Bundler.require

require_relative '../lib/temp_scraper'

require 'logger'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'activerecord-intro.db'
)

ActiveRecord::Base.logger = Logger.new($stdout)