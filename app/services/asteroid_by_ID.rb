class AsteroidByID

  def initialize(id)
    @id = id
  end

  def asteroid
    raw_asteroid = NasaService.new(id).run
    Asteroid.new(
      raw_asteroid["name"],
      raw_asteroid["neo_reference_id"],
      raw_asteroid["is_potentially_hazardous_asteroid"]
    )
  end

  private
    attr_reader :id
end
