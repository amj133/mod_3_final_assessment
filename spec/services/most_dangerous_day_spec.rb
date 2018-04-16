require 'rails_helper'

describe MostDangerousDay do
  describe "instance methods" do
    context "#asteroids" do
      it "returns hash with date key and asteroids collection value" do
        most_dangerous_day_stub

        start_date = "2018-01-01"
        end_date = "2018-01-07"
        date_and_asteroids = MostDangeousDay.new(start_date, end_date).asteroids

        expect(date_and_asteroids.keys[0]).to eq("2018-01-01")
        expect(date_and_asteroids["2018-01-01"].count).to eq(3)
        date_and_asteroids["2018-01-01"].each do |asteroid|
          expect(asteroid).to be_a(Asteroid)
          expect(asteroid["is_potentially_hazardous_asteroid"]).to eq(true)
        end
      end
    end
  end
end
