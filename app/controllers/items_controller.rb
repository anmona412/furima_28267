class ItemsController < ApplicationController
  before_action :check_user, only: [:new, :create]
  before_action :check_item, only: [:show, :edit, :update]

  def index
    @items = Item.all
    @record = Item.count
  end

  def new
    @item = Item.new
  end

  def show
    @sold = BoughtBy.where(item_id: @item.id).exists?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless user_signed_in?  && current_user.id == @item.user_id 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params
      .require(:item)
      .permit(
        :image, :name, :comment, :category_id, :price, :status_id, :burden_id, :prefecture_id, :send_at_id
      )
      .merge(user_id: current_user.id)
  end

  def check_user
    redirect_to user_session_path unless user_signed_in?
  end

  def check_item
    @item = Item.find(params[:id])
  end
end
