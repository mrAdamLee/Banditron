module Banditron
  class BaseStorage
    def self.get_storage(name, config) 
      config ||= {} 
      case name 
        when :memory then MemoryStorage.new(config)
      end

      def init(key, value) 

      end

      def get(key, default=0)

      end

      def set(key, value) 

      end

      def clear!
        
      end
    end
  end
end