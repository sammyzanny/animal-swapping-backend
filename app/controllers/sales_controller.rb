class SalesController < ApplicationController
    skip_before_action :authorized
  

 def create
    user = current_user
    item = Sale.create(item_id: sale_params[:id].to_i, user_id: user.id)
    render json: user
 end

 def destroy
    sale = Sale.find_by(id: params[:id].to_i)
    sale.destroy
    render json: {poop: "poop"}
 end


  private 

  def sale_params
    params.permit(:id)
  end
  
end