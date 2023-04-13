module Banditron 
  class MemoryStorage < BaseStorage 
    def initialize(config)
      #creates new 'memory' 
      @memory = Hash.new(nil)
    end

    def init(key, value) 
      @memory[key] = value if @memory[key].nil?
    end

    def get(key, default=0)
      @memory.fetch(key, default)
    end

    def set(key, value)
      @memory[key] = value
    end

    def clear!
      #clear 'memory' set hash to nil
      @memory = Hash.new(nil)
    end
  end
end