class MostDangerousDayController < ApplicationController
  def index
    @danger_day = MostDangerousDayPresenter.new(params["start_date"], params["end_date"])
  end

end
