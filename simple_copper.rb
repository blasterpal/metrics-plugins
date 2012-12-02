require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'copperegg'
require 'yaml'

# Get a Metrics object:
config_file = "config.yml"
@config = YAML.load(File.open(config_file))
apikey = @config["copperegg"]["apikey"] if !@config["copperegg"]["apikey"].nil? && apikey.nil?
@metrics = CopperEgg::Metrics.new(apikey)
puts "Connected with 
