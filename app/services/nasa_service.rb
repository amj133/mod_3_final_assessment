class NasaService

  def initialize(id = nil)
    @neo_reference_id = id
  end

  def find_by_id
    json_response("/neo/rest/v1/neo/#{neo_reference_id}")
  end

  def asteroids_by_date(start, finish)
    date_params = {"start_date" => start, "end_date" => finish}
    json_response("/neo/rest/v1/feed", base_params.merge!(date_params))
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
end
