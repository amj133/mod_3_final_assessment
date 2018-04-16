require 'rails_helper'

describe "POST /api/v1/user/favorites with api key" do
  it "returns json response with new favorite asteroid" do
    uncle_jesse = User.create(name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
    uncle_jesse.create_api_key(value: "abc123")
    uncle_jesse.favorites.create(neo_reference_id: "2153306")

    get_asteroid_by_id_2_stub

    post "/api/v1/user/favorites?neo_reference_id=2021277&api_key=abc123"
    favorites = JSON.parse(response.body)

    expect(favorites).to be_a(Hash)
    expect(uncle_jesse.favorites.count).to eq(2)
    expect(favorites["id"]).to eq(2)
    expect(favorites["asteroid"]["name"]).to eq("21277 (1996 TO5)")
    expect(favorites["asteroid"]["is_potentially_hazardous_asteroid"]).to eq(false)
  end
end

# *Feature 3: API - Favoriting an Asteroid*
#
# Background: This story assumes the base data from running `rake db:seed`
# This SHOULD NOT save the asteroid data into the database. Asteroid data should be returned from the NASA API. You should save the `neo_reference_id` in the favorites table.
#
# ```When I send a POST request to "/api/v1/user/favorites" with an 'api_key' of 'abc123' and a 'neo_reference_id' of '2021277'
# Then I should receive a response with a status code of 200
# And the body should be JSON as follows:```
#
# ```{
#   "id":2,
#   "neo_reference_id": "2021277",
#   "user_id": 1,
#   "asteroid": {
#     "name": "21277 (1996 TO5)",
#     "is_potentially_hazardous_asteroid": false,
#   }
# }```
