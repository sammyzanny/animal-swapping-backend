class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :visit, :item_search, :name_search]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def visit
    user = User.find_by(username: params[:username])
    if user 
      render json: { user: UserSerializer.new(user) }, status: :accepted
    else
      render json: { error: 'User not found' }, status: :not_acceptable
    end

  end

  def index
    users = User.all
    render json: users
  end

  def item_search
    item = Item.find_by(name: params[:item_name])
    users = User.select{|user| user.inventory.any?{|sale| sale[:id] == item.id}}
    render json: users
  end

  def name_search
    users = User.select{|user| user.username.include?(params[:username])}
    render json: users
  end
 

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :contact )
  end
end
