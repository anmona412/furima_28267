class TransactionsController < ApplicationController
before_action :item, only:[:index, :create]

  def index
  end

  def create
    @street = Transaction.new(
      item_id: street_params[:item_id],
      postal_code: street_params[:postal_code],
      prefecture_id: street_params[:prefecture_id],
      city: street_params[:city],
      address: street_params[:address],
      building: street_params[:building],
      phone_number: street_params[:phone_number],
    )
    if @street.valid?
      pay_item
      @street.save
      return redirect_to item_path(params[:item_id])
    else
      redirect_to item_transactions_path(params[:item_id])
    end
  end

  private

  def street_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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
