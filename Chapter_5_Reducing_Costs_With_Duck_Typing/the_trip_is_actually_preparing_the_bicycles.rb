class Trip
  attr_reader :bicycles, :customers, :vehicle

  # this 'mechanic' argument could be of any class
  def prepare
    mechanic.prepare_bicycles(bicycles)
  end

  #...
end



  # if you happen to pass an instance of *this* class,
  # it works
class mechanic
  def prepare_bicycles(bicycles)
    bicycles.each do |bicycle|
      prepare_bicycle(bicycle)
    end
  end
  def prepare_bicycle(bicycle)
    # ...
  end
end
