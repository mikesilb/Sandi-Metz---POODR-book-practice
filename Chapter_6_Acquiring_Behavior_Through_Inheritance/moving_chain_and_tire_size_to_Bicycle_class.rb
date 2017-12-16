class Bicycle
  attr_reader :size, :chain, :tire_size
  def initialize(args)
    @size = args[:size]
    @chain = args[:chain]
    @tire_size = args[:tire_size]
  end
end

class RoadBike < Bicycle
  #Now a subclass of Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end


  # every bike has the same defaults for
  # tire and chain size
  def spares
    {tape_color: tape_color}
  end
end

class MountainBike < Bicycle
  #Still a subclass of Bicycle (which is now empty)
  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end
  def spares
    super.merge({rear_shock: rear_shock})
  end
end

road_bike = RoadBike.new(size: 'M', tape_color: 'red')
road_bike.size

mountain_bike = MountainBike.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
mountain_bike.size
mountain_bike.spares #Still won't work
