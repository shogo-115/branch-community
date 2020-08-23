require 'rails_helper'
describe Admin do
  describe '#create' do

    # image、name、category、birth_place、profile、email、password、password_confirmationが存在すれば登録できること
    it "is valid with a image、name、category、birth_place、profile、email、password、password_confirmation" do
      admin = build(:admin)
      expect(admin).to be_valid
    end
    
    # imageが空では登録できないこと
    it "is invalid without a image" do
      admin = build(:admin, image: nil)
      admin.valid?
      expect(admin.errors[:image]).to include("can't be blank")
    end
    
    # nameが空では登録できないこと
    it "is invalid without a name" do
      admin = build(:admin, name: nil)
      admin.valid?
      expect(admin.errors[:name]).to include("can't be blank")
    end

    # categoryが空では登録できないこと
    it "is invalid without a category" do
      admin = build(:admin, category: nil)
      admin.valid?
      expect(admin.errors[:category]).to include("can't be blank")
    end

    # birth_placeが空では登録できないこと
    it "is invalid without a birth_place" do
      admin = build(:admin, birth_place: nil)
      admin.valid?
      expect(admin.errors[:birth_place]).to include("can't be blank")
    end

    # profileが空では登録できないこと
    it "is invalid without a profile" do
      admin = build(:admin, profile: nil)
      admin.valid?
      expect(admin.errors[:profile]).to include("can't be blank")
    end

    # emailが空では登録できないこと
    it "is invalid without a email" do
      admin = build(:admin, email: nil)
      admin.valid?
      expect(admin.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できないこと
    it "is invalid without a password" do
      admin = build(:admin, password: nil)
      admin.valid?
      expect(admin.errors[:password]).to include("can't be blank")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      admin = build(:admin, password_confirmation: "")
      admin.valid?
      expect(admin.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # nameが21文字以上であれば登録できないこと
    it "is invalid with a name that has more than 20 characters " do
      admin = build(:admin, name: over_word=21.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) })
      admin.valid?
      expect(admin.errors[:name]).to include("is too long (maximum is 20 characters)")
    end

    # nameが6文字以下では登録できること
    it "is valid with a name that has less than 6 characters " do
      admin = build(:admin, name: "aaaaaa")
      expect(admin).to be_valid
    end

    # profileが500文字以下では登録できること
    it "is invalid with a profile that has more than 501 characters " do
      product = build(:admin, profile: over_word=501.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) })
      product.valid?
      expect(product.errors[:profile]).to include("は500文字以内で入力してください")
    end

    # 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      admin = create(:admin)
      another_admin = build(:admin, email: admin.email)
      another_admin.valid?
      expect(another_admin.errors[:email]).to include("has already been taken")
    end

    # passwordが8文字以上であれば登録できること
    it "is valid with a password that has more than 8 characters " do
      admin = build(:admin, password: "00000000", password_confirmation: "00000000")
      expect(admin).to be_valid
    end

    # passwordが7文字以下であれば登録できないこと
    it "is invalid with a password that has less than 7 characters " do
      admin = build(:admin, password: "0000000", password_confirmation: "0000000")
      admin.valid?
      expect(admin.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end
