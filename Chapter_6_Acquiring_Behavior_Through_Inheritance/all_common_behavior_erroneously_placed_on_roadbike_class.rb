require 'pry'
class Bicycle
  # This class is now empty.
  # All code has been moved to RoadBike.
end

class RoadBike < Bicycle
  #Now a subclass of Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end


  # every bike has the same defaults for
  # tire and chain size
  def spares
    {chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color}
  end
end

class MountainBike < Bicycle
  #Still a subclass of Bicycle (which is now empty)
  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end
end

road_bike = RoadBike.new(size: 'M', tape_color: 'red')
road_bike.size

mountain_bike = MountainBike.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
mountain_bike.size
