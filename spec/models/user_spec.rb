require 'rails_helper'
describe User do
  describe '#create' do

    # image、name、sex、birth_date、birth_place、profile、email、password、password_confirmationが存在すれば登録できること
    it "is valid with a image、name、sex、birth_date、birth_place、profile、email、password、password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a image" do
      user = build(:user, image: nil)
      user.valid?
      expect(user.errors[:image]).to include("can't be blank")
    end
    
    # nameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    # sexが空では登録できないこと
    it "is invalid without a sex" do
      user = build(:user, sex: nil)
      user.valid?
      expect(user.errors[:sex]).to include("can't be blank")
    end

    # birth_dateが空では登録できないこと
    it "is invalid without a birth_date" do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end

    # birth_placeが空では登録できないこと
    it "is invalid without a birth_place" do
      user = build(:user, birth_place: nil)
      user.valid?
      expect(user.errors[:birth_place]).to include("can't be blank")
    end

    # profileが空では登録できないこと
    it "is invalid without a profile" do
      user = build(:user, profile: nil)
      user.valid?
      expect(user.errors[:profile]).to include("can't be blank")
    end

    # emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # nameが8文字以上であれば登録できないこと
    it "is invalid with a name that has more than 7 characters " do
      user = build(:user, name: "aaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 7 characters)")
    end

    # nameが6文字以下では登録できること
    it "is valid with a name that has less than 6 characters " do
      user = build(:user, name: "aaaaaa")
      expect(user).to be_valid
    end

    # profileが500文字以下では登録できること
    it "is invalid with a profile that has more than 501 characters " do
      product = build(:user, profile: over_word=501.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) })
      product.valid?
      expect(product.errors[:profile]).to include("は500文字以内で入力してください")
    end

    # 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが8文字以上であれば登録できること
    it "is valid with a password that has more than 8 characters " do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      expect(user).to be_valid
    end

    # passwordが7文字以下であれば登録できないこと
    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end
