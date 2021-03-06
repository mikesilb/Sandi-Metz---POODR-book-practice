class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(the_data)
    @chainring = the_data[:chainring]
    @cog = the_data[:cog]
    @wheel = the_data[:wheel]
  end

  def gear_inches
    ratio * diameter
  end

  def diameter
    wheel.diameter
  end

  def ratio
    chainring/cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end
  def diameter
    rim + (tire * 2)
  end
end
