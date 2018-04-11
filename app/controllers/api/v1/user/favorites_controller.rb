class Api::V1::User::FavoritesController < ApiBaseController

  def index
    user = ApiKey.find_by_value(params[:api_key]).user

    render json: user.favorites, each_serializer: FavoritesSerializer
  end

end
