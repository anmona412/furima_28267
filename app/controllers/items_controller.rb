class ItemsController < ApplicationController
  def index
  end

  def new
    
  end
end

private

def item_params
  params.require(:item).premit(
    :name, :comment, :category_id, :price, :status_id, :burden_id, :prefecture_id, :send_at_id
  ).merge(user_id: current_user.id)
end