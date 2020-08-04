class ItemsController < ApplicationController
  before_action :check_user, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
 
  def item_params
    params
    .require(:item)
    .permit(
      :image,:name, :comment, :category_id, :price, :status_id, :burden_id, :prefecture_id, :send_at_id
    )
    .merge(user_id: current_user.id)
  end

  def check_user
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end