class Experiment
  attr_accessor :name, :title, :description, :alterntives
  #@@ is a class level variable, this allows  keeping track of all instances of array
  @@instances = []

  def selc.create(name) 
    e = Experiment.new(name: name)
    yield e
    e
  end

  def validate!
    { title: @title, alternatives: @alternatives}.each do |field, value| 
      unless value
        raise MissingConfigurationError, "#{field} must be set in experiment."
      end
    end
  end
end