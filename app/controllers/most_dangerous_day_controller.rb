class MostDangerousDayController < ApplicationController
  def index
    start = DateTime.strptime(params["start_date"], '%d %B, %Y')
    finish = DateTime.strptime(params["end_date"], '%d %B, %Y')
    @start_range = start.strftime("%B %-d, %Y")
    @end_range = finish.strftime("%B %-d, %Y")
    start_search = start.strftime('%Y-%m-%d')
    end_search = finish.strftime('%Y-%m-%d')

    asteroids_and_date = MostDangerousDay.new(start_search, end_search).asteroids
    danger_date = DateTime.strptime(asteroids_and_date.keys.first, '%Y-%m-%d')
    @most_dangerous_day = danger_date.strftime('%B %-d, %Y')
    @asteroids = asteroids_and_date.values.flatten
  end

end
