class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :contact, :wishlist, :inventory, :customs, :purchases, :exchanges, :pending_purchases, :pending_exchanges

  def wishlist
    @object.wishlist
  end 

  def customs
    @object.items
  end

  def inventory
    @object.inventory
  end

  def purchases
    @object.purchases
  end

  def pending_purchases
    @object.pending_purchases
  end

  def exchanges
    @object.exchanges
  end

  def pending_exchanges
    @object.pending_exchanges
  end
  
end
