require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'copperegg'

# Get a @metrics object:
config_file = "config.yml"
@config = YAML.load(File.open(config_file))
apikey = @config["copperegg"]["apikey"]
@copper = CopperEgg::Metrics.new(apikey)



group_name = "my_metric_group"
mg = @copper.metric_group(group_name)
instance = 'ip-10-35-99-201'
loop = 20 

if mg.nil?
  puts "metric group not found, creating and bailing..."
  # check
  groupcfg = {}
  groupcfg["name"] = group_name
  groupcfg["label"] = "Cool New Group Visible Name"
  groupcfg["frequency"] = "60"  # data is sent every 60s
  groupcfg["metrics"] = [
    {"type" => "ce_counter", "name" => "counter_my_value", "unit" => "BlahUnit"},
    {"type" => "ce_gauge" , "name" => "gauge_my_value", "unit" => "FooUnit"}]
  res = @copper.create_metric_group(group_name, groupcfg)
else
  @metrics = {}
  puts "looping and setting random metrics..."
  loop.times do |x|
    count = rand(20)
    gauge = rand(30)
    @metrics['counter_my_value'] = count
    @metrics['gauge_my_value'] = gauge
    @copper.store_sample(group_name, instance, Time.now.to_i, @metrics)
    sleep 60 
  end
end

