class NasaService

  def initialize(search_params = {})
    @neo_reference_id = search_params[:neo_reference_id]
    @start_date = search_params[:start_date]
    @end_date = search_params[:end_date]
  end

  def asteroid_by_id
    json_response("/neo/rest/v1/neo/#{neo_reference_id}", base_params)
  end

  def asteroids_by_date
    response = json_response("/neo/rest/v1/feed", date_params)
  end


  private
    attr_reader :neo_reference_id, :start_date, :end_date

    def conn
      Faraday.new(:url => "https://api.nasa.gov/")
    end

    def base_params
      { "api_key" => ENV['NASA_API_KEY'] }
    end

    def json_response(uri, params)
      response = conn.get(uri, params)
      response = JSON.parse(response.body)
    end

    def date_params
      base_params.merge!({
        "start_date" => start_date,
        "end_date" => end_date
      })
    end

end
