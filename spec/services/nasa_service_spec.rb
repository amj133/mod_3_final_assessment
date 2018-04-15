require 'rails_helper'

describe NasaService do
  describe "insstance methods" do
    context "#asteroids_by_date" do
      it "returns raw collection of asteroids" do
        VCR.use_cassette("WQP service station by huc search") do
          search_params = {
            "start_date" => "2018-01-01",
            "end_date" => "2018-01-07"
          }

          raw_asteroids = NasaService.new(search_params).asteroids_by_date

          expect(raw_asteroids).to be_a(Hash)
        end
      end
    end
  end
end
