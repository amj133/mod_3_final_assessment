class NasaService

  def initialize(search_params = {})
    @neo_reference_id = search_params[:neo_reference_id]
    @start_date = search_params[:start_date]
    @end_date = search_params[:end_date]
  end

  def asteroid_by_id
    json_response("/neo/rest/v1/neo/#{neo_reference_id}")
  end

  def asteroids_by_date
    # this belongs in wrapper class
    date_params = {"start_date" => start_date, "end_date" => end_date}
    response = json_response("/neo/rest/v1/feed", base_params.merge!(date_params))
    date = find_most_dangerous_day(response)
    { date: create_asteroids }
  end


  private
    attr_reader :neo_reference_id

    def conn
      Faraday.new(:url => "https://api.nasa.gov/")
    end

    def base_params
      {
        "api_key" => ENV['NASA_API_KEY']
      }
    end

    def json_response(uri)
      response = conn.get(uri, base_params)
      response = JSON.parse(response.body)
    end

    def find_most_dangerous_day(response)
      # enter earth-shatteringly (pun intended) awesome & refactored code
    end

    def create_asteroids
      # refactored code
    end
end
