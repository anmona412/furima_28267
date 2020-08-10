class TransactionsController < ApplicationController
  before_action :item, only: [:index, :create]

  def index
    if user_signed_in? == false
      redirect_to user_session_path
    elsif current_user.id == @item.user_id || BoughtBy.where(item_id: @item.id).exists?
      redirect_to root_path
    end
  end

  def new
    @street = ItemBought.new
  end

  def create
    @street = ItemBought.new(street_params)
    if @street.valid?
      pay_item
      @street.save
      redirect_to item_path(params[:item_id])
    else
      redirect_to item_transactions_path(params[:item_id])
    end
  end

  private

  def street_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: street_params[:token],
      currency: 'jpy'
    )
  end

  def item
    @item = Item.find(params[:item_id])
  end
end
