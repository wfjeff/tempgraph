require 'bundler/setup'
Bundler.require

require 'chartkick'
require 'active_record'
require 'logger'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/poltergeist'

require_relative '../lib/reading'
require_relative '../lib/twine'
require_relative '../lib/scrape_driver'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'tempgraph',
  :encoding => 'unicode',
  :pool => 5,
  :username => 'williamjeffries',
  :password => ''
)

Capybara.app = Rack::Builder.parse_file(File.expand_path("../../config.ru", __FILE__)).first

DB = ActiveRecord::Base.connection