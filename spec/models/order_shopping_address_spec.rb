require 'rails_helper'

RSpec.describe OrderShoppingAddress, type: :model do
  describe '発送情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shopping_address = FactoryBot.build(:order_shopping_address, user_id: @user, item_id: @item)
    end

    context '内容に問題ない場合' do
      it 'token と アドレス情報すべての値が正しく入力されていれば保存できること' do
        expect(@order_shopping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shopping_address.building_name = ''
        expect(@order_shopping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_shopping_address.postal_code = ''
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが 「3桁ハイフン4桁」でないと保存できないこと' do
        @order_shopping_address.postal_code = '1234567'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'origin_region_idを選択していないと保存できないこと' do
        @order_shopping_address.origin_region_id = '1'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Origin region can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @order_shopping_address.street_address = ''
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shopping_address.phone_number = ''
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上の半角数値のみでないと保存できないこと' do
        @order_shopping_address.phone_number = '111111111'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberが11桁以内の半角数値のみでないと保存できないこと' do
        @order_shopping_address.phone_number = '111111111111'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order_shopping_address.item_id = nil
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shopping_address.user_id = nil
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_shopping_address.token = nil
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
