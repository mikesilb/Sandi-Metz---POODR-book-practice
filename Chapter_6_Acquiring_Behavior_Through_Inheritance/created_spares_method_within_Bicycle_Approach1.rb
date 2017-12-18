class Bicycle
  attr_reader :size, :chain, :tire_size
  def initialize(args)
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10 speed' #used commonly by 'RoadBike' and 'MountainBike'
  end
  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end
  def spares
    { tire_size: tire_size,
      chain: chain
    }
  end
end

class RoadBike < Bicycle
  #Now a subclass of Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def default_tire_size
    '23' #Default for only 'RoadBike'
  end

  def spares
    super.merge ({tape_color: tape_color})
  end
end

class MountainBike < Bicycle
  #Still a subclass of Bicycle (which is now empty)
  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def default_tire_size
    '2.1' #Default for only 'MountainBike'
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
end
