require 'logger'
require 'yaml'

def establish_connection environment
  root   = File.expand_path('../..', __FILE__)
  config = YAML.load_file(File.join(root, 'config', 'database.yml'))
  logger = Logger.new(File.join(root, 'log', "#{environment}.log"))

  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.logger         = logger

  ActiveRecord::Base.establish_connection(config[environment.to_s])
end
