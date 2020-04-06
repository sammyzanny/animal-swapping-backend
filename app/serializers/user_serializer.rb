class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :contact, :wishlist, :inventory

  def wishlist
    @object.wishlist
  end 

  def inventory
    @object.inventory
  end
end
