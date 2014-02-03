require "galaxy/message_processors/base"
require "galaxy/message_processors/collect_galaxy_symbol"
require "galaxy/message_processors/calc_galaxy_numerical"
require "galaxy/message_processors/collect_metal"
require "galaxy/message_processors/calc_metal_price"

module Galaxy
  class Message
    def initialize text
      @text = text.strip
    end

    def process
      processor.process
    end

    def processor
      @processor ||= Processors.collect do |proc, regex|
        match = @text.match /#{regex}/
        if match
          "Galaxy::#{proc.to_s.classify}".constantize.new match.to_a
        else
          nil
        end
      end.compact.first || MessageProcessor::Base.new
    end

    Processors = {
      :collect_galaxy_symbol    => "^(\\w+)[ ]+is[ ]+([IVXLCDM])$$",
      :calc_galaxy_numerical    => "^how[ ]+much[ ]+is[ ]+(.*)[ ]*\\?$",
      :collect_metal            => "^(.*)[ ]+(\\w+)[ ]+is[ ]+(\\d+)[ ]+Credits$",
      :calc_metal_price         => "^how[ ]+many[ ]+Credits[ ]+is[ ]+(.*)[ ]+(\\w+)[ ]*\\?$"
    }
  end
end


