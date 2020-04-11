class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :contact, :wishlist, :inventory, :customs

  def wishlist
    @object.wishlist
  end 

  def customs
    @object.items
  end

  def inventory
    @object.inventory
  end
end
