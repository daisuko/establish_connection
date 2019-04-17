require 'yaml'
require 'rubygems'
require 'bundler'

environment = ENV['e'] || :development
root        = File.expand_path('..', __FILE__)
config      = YAML.load_file(File.join(root, 'config', 'database.yml'))

Bundler.require(:default, environment)

require root + '/config/boot'

include ActiveRecord::Tasks

DatabaseTasks.env                    = environment
DatabaseTasks.database_configuration = config
DatabaseTasks.db_dir                 = root + '/db'
DatabaseTasks.migrations_paths       = root + '/db/migrate'

task :environment do
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection environment
end

load 'active_record/railties/databases.rake'
