class Asteroid
  attr_reader :name, :neo_reference_id, :hazardous

  def initialize(name, id, hazardous = true)
    @name = name
    @neo_reference_id = id
    @hazardous = hazardous
  end

end
