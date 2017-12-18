class Bicycle
  attr_reader :size, :chain, :tire_size
  def initialize(args)
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args) # Bicycle both sends this
  end

  def post_initialize(args) # and implements this
    nil
  end

  def default_chain
    '10 speed'
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

  #NOTICE THAT THERE IS NO initialize method now!!!

  def post_initialize(args)
    @tape_color = args[:tape_color] #RoadBike can
                                  #optionally override it
  end

  def default_tire_size
    '23' #Default for only 'RoadBike'
  end

  def spares
    super.merge ({tape_color: tape_color})
  end
end

class MountainBike < Bicycle

  #NOTICE THAT THERE IS NO initialize method now!!!

  def post_initialize(args)
    @front_shock = args[:front_shock] #MountainBike can
    @rear_shock = args[:rear_shock] #optionally override it
  end

  def default_tire_size
    '2.1' #Default for only 'MountainBike'
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
end
