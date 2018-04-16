class MostDangerousDay

  def initialize(start, finish)
    @start_date = start
    @end_date = finish
  end

  def asteroids
    response = NasaService.new(search_params).asteroids_by_date
    most_dangerous_date_and_asteroids(response)
  end

  private
    attr_reader :start_date, :end_date

    def search_params
      {
        start_date: start_date,
        end_date: end_date
      }
    end

    def dates_and_dangerous_asteroids(response)
      date_and_count = Hash.new([])
      response["near_earth_objects"].map do |date, asteroids|
        date_and_count[date] = asteroids.map do |asteroid|
          if asteroid["is_potentially_hazardous_asteroid"] == true
            Asteroid.new(asteroid["name"], asteroid["neo_reference_id"])
          end
        end.compact
      end
      date_and_count
    end

    def most_dangerous_date_and_asteroids(response)
      sorted = dates_and_dangerous_asteroids(response).sort_by {|k, v| v.count}
      { sorted.last[0] => sorted.last[1] }
    end

end
