class Gear
  attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end
  def ratio
    chainring/cog.to_f
  end
end

the_initial_gear = Gear.new(67, 13)
puts the_initial_gear.ratio

my_second_gear = Gear.new(85, 67)
puts my_second_gear.ratio
