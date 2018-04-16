class MostDangerousDay

  def initialize(start, finish)
    @start_date = start
    @end_date = finish
  end

  def asteroids
    response = NasaService.new(search_params).asteroids_by_date
    date = most_dangerous_date(response)
    {date => asteroids_for_most_dangerous_date(response, date)}
  end

  private
    attr_reader :start_date, :end_date

    def search_params
      {
        start_date: start_date,
        end_date: end_date
      }
    end

    def dates_and_asteroid_count(response)
      date_and_count = Hash.new(0)
      response["near_earth_objects"].each do |date, asteroids|
        asteroids.each do |asteroid|
          if asteroid["is_potentially_hazardous_asteroid"] == true
            date_and_count[date] += 1
          end
        end
      end
      date_and_count
    end

    def most_dangerous_date(response)
      dates_and_asteroid_count(response).sort_by {|k, v| v}.last[0]
    end

    def asteroids_for_most_dangerous_date(response, date)
      asteroids = []
      response["near_earth_objects"][date].each do |asteroid|
        if asteroid["is_potentially_hazardous_asteroid"] == true
          asteroids << Asteroid.new(asteroid["name"], asteroid["neo_reference_id"])
        end
      end
      asteroids
    end

end
