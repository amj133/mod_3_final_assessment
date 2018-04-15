class AsteroidByID

  def initialize(id)
    @id = id
  end

  def asteroid
    raw_asteroid = NasaService.new(search_params).asteroid_by_id
    Asteroid.new(
      raw_asteroid["name"],
      raw_asteroid["neo_reference_id"],
      raw_asteroid["is_potentially_hazardous_asteroid"]
    )
  end

  private
    attr_reader :id

    def search_params
      {neo_reference_id: id}
    end
end
