# Trip preparation becomes more complicated
class Trip
  attr_reader :bicycles, :customers, :vehicle
  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    end
  end
end



#when you introduce TripCoordinator and Driver
class TripCoordinator
  def buy_food
    #...
  end
end

class Driver
  def gas_up
    #...
  end

  def fill_water_tank(vehicle)
    #...
  end
end
