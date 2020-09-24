require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品が成功するとき' do
      it 'image, name, info, category_id, sales_status_id, shipping_fee_status_id, prefecture_id, scheduled_idの値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が失敗するとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = "nil"
        @item.valid?
      end
      it 'infoが空だと出品できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格設定が¥300〜9,999,999の範囲でないと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'category_idを選択しなければ出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'sales_status_idを選択しなければ出品できない' do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end
      it 'shipping_fee_status_idを選択しなければ出品できない' do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      it 'prefecture_idを選択しなければ出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'scheduled_delivery_idを選択しなければ出品できない' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end
    end
  end
end