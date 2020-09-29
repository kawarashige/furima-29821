require 'rails_helper'
describe OrderAddress, type: :model  do
  describe '商品の購入' do
    before do
      @order = FactoryBot.build(:order_address)
    end
    
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'クレジットカード情報が正しくないと購入できない' do
        @order.token = "ABC"
        @order.valid?
      end
      it '郵便番号が空だと登録できない' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれていないと購入できない' do
        @order.postal_code = "123456"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県を選択しないと購入できません' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村が空だと購入できません' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できません' do
        @order.addresses = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だと購入できません' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内出ないと購入できない' do
        @order.phone_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end

  end
end
