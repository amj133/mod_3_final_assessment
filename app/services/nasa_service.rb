class NasaService

  def initialize(id)
    @neo_reference_id = id
  end

  def run
    conn = Faraday.new(:url => "https://api.nasa.gov/")
    params = { "api_key" => ENV['NASA_API_KEY'] }
    response = conn.get("/neo/rest/v1/neo/#{neo_reference_id}", params)
    response = JSON.parse(response.body)
  end


  private
    attr_reader :neo_reference_id
end
