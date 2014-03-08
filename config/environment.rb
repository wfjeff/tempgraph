require 'bundler/setup'
Bundler.require

require 'chartkick'
require 'active_record'
require 'logger'
require 'rack/test'
require 'capybara/rspec'

require_relative '../lib/reading'
require_relative '../lib/twine'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'activerecord-intro.db'
)

Capybara.app = Rack::Builder.parse_file(File.expand_path("../../config.ru", __FILE__)).first

DB = ActiveRecord::Base.connection

