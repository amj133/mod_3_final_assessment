class MostDangerousDayController < ApplicationController
  def index
    start = DateTime.strptime(params["start_date"], '%d %B, %Y')
    finish = DateTime.strptime(params["end_date"], '%d %B, %Y')
    @start_date = start.strftime("%B %-d, %Y")
    @end_date = finish.strftime("%B %-d, %Y")
    start = start.strftime('%Y-%m-%d')
    finish = finish.strftime('%Y-%m-%d')

    conn = Faraday.new(:url => "https://api.nasa.gov/")

    params = {
      "start_date" => start,
      "end_date" => finish,
      "api_key" => ENV['NASA_API_KEY']
    }

    response = conn.get("/neo/rest/v1/feed", params)
    response = JSON.parse(response.body)


    date_and_count = Hash.new(0)
    response["near_earth_objects"].each do |date, asteroids|
      asteroids.each do |asteroid|
        if asteroid["is_potentially_hazardous_asteroid"] == true
          date_and_count[date] += 1
        end
      end
    end

    most_dangerous_date = date_and_count.sort_by {|k, v| v}.last[0]
    most_dangerous_datetime = DateTime.strptime(most_dangerous_date, '%Y-%m-%d')
    @most_dangerous_day = most_dangerous_datetime.strftime('%B %-d, %Y')

    @asteroids = []
    response["near_earth_objects"][most_dangerous_date].each do |asteroid|
      if asteroid["is_potentially_hazardous_asteroid"] == true
        @asteroids << Asteroid.new(asteroid["name"], asteroid["neo_reference_id"], asteroid["is_potentially_hazardous_asteroid"])
      end
    end
  end

end
