class ItemsController < ApplicationController
    skip_before_action :authorized
  

 def create
    user = current_user
    item = Item.new(name: params[:item][:name])
    item.img = "https://vignette.wikia.nocookie.net/animalcrossing/images/3/34/Nhlloid.png/revision/latest?cb=20200222181723"
    item.category = "Custom " + params[:item][:category]
    item.user_id = user.id
    item.save
    
    if item.valid?
      render json: item
    else 
      render json: {error: "Item name taken"}
    end
 end

 def destroy
    item = Item.find_by(id: params[:id].to_i)
    if item.user_id == current_user.id
      item.sales.destroy_all
      item.wishes.destory_all
      item.destroy
      render json: item
    else 
      render json: {error: 'Not your Item'}
    end
 end 

  def index
    # items = Item.all
    # render json: { items: ActiveModel::SerializableResource.new(items) }
    
    items = Item.all.select{|item| item.category.exclude?("Custom")}.sort_by{|item| item.category}
    custom_items = Item.all.select{|item| item.category.include?("Custom")}.sort_by{|item| item.category}

    render json: { items: ActiveModel::SerializableResource.new(items), customItems: ActiveModel::SerializableResource.new(custom_items) }
  end
  
end