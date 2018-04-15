class MostDangerousDay

  def initialize(start, finish)
    @start_date = start
    @end_date = finish
  end

  def asteroids
    NasaService.new.asteroids_by_date(search_params)
  end

  private
    attr_reader :start_date, :end_date

    def search_params
      {
        "start_date" => start_date,
        "end_date" => end_date
      }
    end

end
