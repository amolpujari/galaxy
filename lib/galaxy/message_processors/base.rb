module Galaxy
  module MessageProcessor
    class Base
      def initialize match=nil
        @match = match
      end

      def process
        puts "I have no idea what you are talking about"
      end
    end
  end
end