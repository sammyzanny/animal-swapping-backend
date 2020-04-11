class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :img, :user_id


end
