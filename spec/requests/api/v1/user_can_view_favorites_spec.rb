require 'rails_helper'

describe "GET /api/v1/user/favorites with api key" do
  it "returns json response with favorite asteroid" do
    uncle_jesse = User.create(name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
    uncle_jesse.create_api_key(value: "abc123")
    uncle_jesse.favorites.create(neo_reference_id: "2153306")

    get "/api/v1/user/favorites?api_key=abc123"

    favorites = JSON.parse(response.body)

    expect(favorites).to be_a(Array)
    expect(favorites.first).to be_a(Hash)
    expect(favorites.first["id"]).to eq(1)
    expect(favorites.first["asteroid"]["name"]).to eq("153306 (2001 JL1)")
    expect(favorites.first["asteroid"]["is_potentially_hazardous_asteroid"]).to eq(false)
  end
end



# *Feature 2: API - Retrieving a user’s favorites*
#
# Background: This story assumes the base data from running `rake db:seed`. Registered user has an `api_key` of `abc123`.
#
# ```As a registered user
# When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'
# Then I should receive a JSON response as follows:```
#
# ```[
#   {
#     "id":1,
#     "neo_reference_id": "2153306",
#     "user_id": 1,
#     "asteroid": {
#       "name": "153306 (2001 JL1)",
#       "is_potentially_hazardous_asteroid": false,
#     }
#   }
# ]```
