require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'copperegg'
require 'yaml'
require 'pry'

# Get a Metrics object:
config_file = "config.yml"
config = YAML.load(File.open(config_file))
apikey = config["copperegg"]["apikey"] 
@copper = CopperEgg::Metrics.new(apikey)
puts "connected with #{@copper.apikey} on variable @copper"

#Start REPL
#binding.pry


