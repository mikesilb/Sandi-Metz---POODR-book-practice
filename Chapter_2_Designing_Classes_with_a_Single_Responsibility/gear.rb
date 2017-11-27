class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end
  def ratio
    chainring/cog.to_f
  end
  def gear_inches
    ratio * (rim + (tire * 2))
  end
end

the_initial_bike_setup = Gear.new(52, 11, 26, 1.5)
puts the_initial_bike_setup.gear_inches

my_second_bike_setup = Gear.new(52, 11, 24, 1.25)
puts my_second_bike_setup.gear_inches
