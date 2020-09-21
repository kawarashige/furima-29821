require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が成功するとき' do
      it "nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, birth_dayの値が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で登録できる" do
        @user.password = "111aaa"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合で登録できる" do
        @user.password = "111aaa"
        expect(@user).to be_valid
      end
      it "first_nameが全角(漢字・ひらがな・カタカナ)で登録できる" do
        @user.first_name = "山田"
        expect(@user).to be_valid
      end
      it "last_nameが全角(漢字・ひらがな・カタカナ)で登録できる" do
        @user.last_name = "陸太郎"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナで登録できる" do
        @user.first_name_kana =  "ヤマダ"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カタカナで登録できる" do
        @user.last_name_kana = "リクタロウ"
      end
    end
  
    context '新規登録が失敗するとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken") 
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
        @user.first_name = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
        @user.last_name = "Rikutarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが全角カタカナでなければ登録できない" do
        @user.first_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが全角カタカナでなければ登録できない" do
        @user.last_name_kana = "りくたろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end