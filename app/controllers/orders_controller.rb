class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_eligible, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    # @item = Item.find(params[:item_id])  # 追加
    @order_shopping_address = OrderShoppingAddress.new
  end

  def create
    # @item = Item.find(params[:item_id])
    @order_shopping_address = OrderShoppingAddress.new(order_params)
    if @order_shopping_address.valid?
      pay_item
      @order_shopping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shopping_address).permit(:postal_code, :origin_region_id, :municipality, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_not_eligible
    return unless @item.order.present? || current_user == @item.user

    redirect_to root_path
  end
end
