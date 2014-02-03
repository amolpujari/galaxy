require "#{File.dirname(__FILE__)}/../lib/galaxy.rb"
include Galaxy

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end

class IntergalacticTransaction
  def initialize transaction_output
    @transaction_output = transaction_output
  end

  def should_output output
    @transaction_output.split("\n").should == output.split("\n")[1..-2].collect{|line| line.strip}
  end
end

def intergalactic_transaction input
  IntergalacticTransaction.new capture_stdout{ input.split("\n")[1..-2].each{|line| Message.new(line).process} }
end

