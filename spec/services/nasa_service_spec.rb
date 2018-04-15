require 'rails_helper'

describe NasaService do
  describe "insstance methods" do
    context "#asteroids_by_date" do
      it "returns raw collection of asteroids" do
        VCR.use_cassette("Nasa Service Asteroids By Date Search") do
          search_params = {
            start_date: "2018-01-01",
            end_date: "2018-01-07"
          }

          raw_asteroids = NasaService.new(search_params).asteroids_by_date

          expect(raw_asteroids).to be_a(Hash)

          expect(raw_asteroids["near_earth_objects"]).to be_a(Hash)
          expect(raw_asteroids["near_earth_objects"]).to have_key("2018-01-01")
          expect(raw_asteroids["near_earth_objects"]).to have_key("2018-01-07")

          expect(raw_asteroids["near_earth_objects"]["2018-01-07"]).to be_a(Array)
          expect(raw_asteroids["near_earth_objects"]["2018-01-07"][0]).to be_a(Hash)
          expect(raw_asteroids["near_earth_objects"]["2018-01-07"][0]).to have_key("is_potentially_hazardous_asteroid")
          expect(raw_asteroids["near_earth_objects"]["2018-01-07"][0]["is_potentially_hazardous_asteroid"]).to eq(false)
        end
      end
    end
  end
end
