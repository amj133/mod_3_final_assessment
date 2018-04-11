class Asteroid
  attr_reader :name, :neo_reference_id

  def initialize(name, id)
    @name = name
    @neo_reference_id = id
  end

end
