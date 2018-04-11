class FavoritesSerializer < ActiveModel::Serializer
  attributes :id, :neo_reference_id, :user_id, :asteroid

  def user_id
    object.user.id
  end

  def asteroid
    asteroid = AsteroidByID.new(object.neo_reference_id).asteroid
    {
      "name" => asteroid.name,
      "is_potentially_hazardous_asteroid" => asteroid.hazardous
    }
  end
end
