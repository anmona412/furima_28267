class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @street = ItemBought.new(street_params)
    if @street.valid?
      pay_item
      @street.save
      return redirect_to item_path(params[:item_id])
    else
      render 'index'
    end
  end

  private

  def street_params
    params.permit(:item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token)
  end

  def pay_item
    Payjp.api_key =ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: street_params[:token],
      currency: 'jpy'
    )
  end
end
