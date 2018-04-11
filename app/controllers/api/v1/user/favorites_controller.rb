class Api::V1::User::FavoritesController < ApiBaseController

  def index
    user = ApiKey.find_by_value(params[:api_key]).user

    render json: user.favorites, each_serializer: FavoritesSerializer
  end

  def create
    user = ApiKey.find_by_value(params[:api_key]).user
    new_fav = user.favorites.create(neo_reference_id: params["neo_reference_id"])

    render json: new_fav, serializer: FavoritesSerializer
  end

end
