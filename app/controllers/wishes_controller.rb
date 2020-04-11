class WishesController < ApplicationController
    skip_before_action :authorized
  

 def create
    user = current_user
    item = Wish.create(item_id: wish_params[:id].to_i, user_id: user.id)
    render json: user
 end

 def destroy
    wish = Wish.find_by(id: params[:id].to_i)
    wish.destroy
    render json: {poop: "poop"}
 end


  private 

  def wish_params
    params.permit(:id)
  end
  
end