class MostDangerousDayController < ApplicationController
  def index
    @start_date = params["start_date"]
    @end_date = params["end_date"]
    start = DateTime.strptime(params["start_date"], '%d %B, %Y')
    finish = DateTime.strptime(params["end_date"], '%d %B, %Y')
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

    
    binding.pry
  end

end
