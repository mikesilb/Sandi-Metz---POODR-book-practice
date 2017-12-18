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
    }.merge(local_spares)
  end
  def local_spares
    {}  #Allows subclass' local_spares to override
  end

  def default_chain
    '10 speed'
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

  def local_spares
    {tape_color: tape_color}
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

  def local_spares
    {rear_shock: rear_shock}
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    {flag: flag}
  end

  def default_chain
    "9-speed"
  end

  def default_tire_size
    '28'
  end
end

bent = RecumbentBike.new(flag: 'tall and orange')
bent.spares
# -> {:tire_size => "28",
#     :chain     => "9-speed",
#     :flag      => "tall and orange"}
