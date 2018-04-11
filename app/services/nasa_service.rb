class NasaService

  def initialize(id = nil)
    @neo_reference_id = id
  end

  def find_by_id
    json_response("/neo/rest/v1/neo/#{neo_reference_id}")
    # conn = Faraday.new(:url => "https://api.nasa.gov/")
    # params = { "api_key" => ENV['NASA_API_KEY'] }
    # response = conn.get("/neo/rest/v1/neo/#{neo_reference_id}", params)
    # response = JSON.parse(response.body)
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
