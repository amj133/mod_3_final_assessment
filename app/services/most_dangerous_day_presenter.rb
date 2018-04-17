class MostDangerousDayPresenter

  def initialize(start_date, end_date)
    @start_date = DateTime.strptime(start_date, '%d %B, %Y')
    @end_date = DateTime.strptime(end_date, '%d %B, %Y')
  end

  def date_range
    [start_date.strftime("%B %-d, %Y"),
      end_date.strftime("%B %-d, %Y")]
  end

  def danger_date
    @asteroids_and_date = asteroids_and_date
    danger_date = DateTime.strptime(@asteroids_and_date.keys.first, '%Y-%m-%d')
    danger_date.strftime('%B %-d, %Y')
  end

  def asteroids
    @asteroids_and_date.values.flatten
  end

  private
    attr_reader :start_date, :end_date

    def asteroids_and_date
      start_search = start_date.strftime('%Y-%m-%d')
      end_search = end_date.strftime('%Y-%m-%d')
      MostDangerousDay.new(start_search, end_search).asteroids
    end

end
