class ItemsController < ApplicationController
    skip_before_action :authorized
  

 def create
    pp = item_params
    item = Item.create(item_params)
    item.img = "https://vignette.wikia.nocookie.net/animalcrossing/images/3/34/Nhlloid.png/revision/latest?cb=20200222181723"
    item.category = "Custom"
    item.save
    render json: item
 end

  def index
    # items = Item.all
    # render json: { items: ActiveModel::SerializableResource.new(items) }
    items = Item.all
    render json: items
  end

  private 
  def item_params
    params.require(:item).permit(:content, :language, :user_id, :tags, :rating)
  end
  
end