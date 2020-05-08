class RequestsController < ApplicationController
    def create
        user = current_user
        request = Request.create(seller_id: params[:sellerId], buyer_id: user.id, item_id: params[:itemId])
        if request.valid?
            render json: {id: request.id, otherUser: UserSerializer.new(request.seller), item: ItemSerializer.new(request.item)} 
        else
            render json: {error: "Request did not go through"}
        end
    end

    def update
        request = Request.find(params[:id])
        request.status = params[:status]
        request.save
        user = User.find(params[:otherUserId])
        item = Item.find(params[:itemId])
        if request.valid?
            render json: {id: request.id, otherUser: UserSerializer.new(user), item: ItemSerializer.new(item)} 
        else
            render json: {error: "Response did not go through"}
        end
        
    end

end
