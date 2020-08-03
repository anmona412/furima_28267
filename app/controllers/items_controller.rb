class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new

    unless user_signed_in?
      redirect_to user_session_path
    end
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
end