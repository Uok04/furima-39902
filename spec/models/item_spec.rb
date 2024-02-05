require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録できる場合' do
      it '正常に出品登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品登録できない場合' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image を添付してください')
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'conditionが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shopping_fee_burdenが空では登録できない' do
        @item.shopping_fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee burden can't be blank")
      end

      it 'origin_regionが空では登録できない' do
        @item.origin_region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin region can't be blank")
      end

      it 'days_to_shipが空では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数値で入力してください')
      end

      it '価格は半角数値でなければ登録できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数値で入力してください')
      end

      it '価格は299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格は10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '商品名が41文字以上では登録できない' do
        @item.item_name = ('A' * 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name は40文字以下で入力してください')
      end

      it '商品説明が1001文字以上では登録できない' do
        @item.description = ('A' * 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Description は1000文字以下で入力してください')
      end
    end
  end
end
