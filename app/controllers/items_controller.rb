class ItemsController < ApplicationController
    skip_before_action :authorized
  

 def create
    user = current_user
    item = Item.new(name: params[:item][:name])
    item.img = "https://i.ibb.co/fFxHGp4/gear.png"
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
      item.wishes.destroy_all
      item.requests.destroy_all
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