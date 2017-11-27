class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end
  def diameters
    wheels.collect do |wheel|
      diameter(wheel)
    end
  end
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end
end
