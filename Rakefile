require 'yaml'
require 'rubygems'
require 'bundler'

environment = (ENV['e'] || :development).to_s
root        = File.expand_path('..', __FILE__)
config      = YAML.load_file(File.join(root, 'config', 'database.yml'))

Bundler.require(:default, environment)

require root + '/config/boot'

ActiveRecord::Tasks::DatabaseTasks.env                    = environment
ActiveRecord::Tasks::DatabaseTasks.root                   = root
ActiveRecord::Tasks::DatabaseTasks.database_configuration = config
ActiveRecord::Tasks::DatabaseTasks.db_dir                 = root + '/db'
ActiveRecord::Tasks::DatabaseTasks.migrations_paths       = root + '/db/migrate'

task :environment do
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection environment.to_sym
end

load 'active_record/railties/databases.rake'
