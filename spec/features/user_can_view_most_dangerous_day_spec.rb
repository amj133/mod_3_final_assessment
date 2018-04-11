require 'rails_helper'

feature "user can view most dangerous day" do
  context "visits root and enters start & end date" do
    describe "clicks most dangerous day button" do
      it "forwards user to most dangerous day page and displays date with asteroids" do
        visit root_path

        fill_in("Start date", with: "2018-01-01")
        fill_in("End date", with: "2018-01-07")
        click_button("Determine Most Dangerous Day")

        expect(current_path).to eq("/most_dangerous_day")
        expect(page).to have_content("Most Dangerous Day")

        expect(page).to have_content("January 1, 2018 - January 7, 2018")
        expect(page).to have_content("Beware of: January 1, 2018")

        expect(page).to have_content("Name: (2014 KT76)")
        expect(page).to have_content("NEO Reference ID: 3672906")

        expect(page).to have_content("Name: (2001 LD)")
        expect(page).to have_content("NEO Reference ID: 3078262")

        expect(page).to have_content("Name: (2017 YR1)")
        expect(page).to have_content("NEO Reference ID: 3794979")
      end
    end
  end
end




# Background:
# * This story should use the Asteroids Neo - Feed: https://api.nasa.gov/api.html#neows-feed
#
# Feature: A guest user visits the root page and enters a start date and end date. The resulting page will display the most dangerous day in that range based on which day has the most `is_potentially_dangerous_asteroid` set to `true`. Given the scenario below, it should be January 1, 2018 with 3 potentially dangerous asteroids.
#
# As a guest user
# When I visit "/"
# And I enter "2018-01-01" into the start date
# And I enter "2018-01-07" into the end date
# And I click "Determine Most Dangerous Day"
#
# Then I should be on "/most_dangerous_day"
# And I should see a heading for "Most Dangerous Day"
# And I should see "January 1, 2018 - January 7, 2018"
# And I should see a heading for the most dangerous day in that range "January 1, 2018"
# And I should see 3 asteroids in that list
#
# And I should see "Name: (2014 KT76)"
# And I should see "NEO Reference ID: 3672906"
#
# And I should see "Name: (2001 LD)"
# And I should see "NEO Reference ID: 3078262"
#
# And I should see "Name: (2017 YR1)"
# And I should see "NEO Reference ID: 3794979"
