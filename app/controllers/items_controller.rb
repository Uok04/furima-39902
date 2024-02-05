class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :item_name, :description, :category_id, :condition_id,
                                 :shopping_fee_burden_id, :origin_region_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
