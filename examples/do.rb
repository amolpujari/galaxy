require "./#{File.dirname(__FILE__)}/../lib/galaxy"
include Galaxy

File.readlines("./#{ARGV[0]}").each do |line|
  Message.new(line).process
end
