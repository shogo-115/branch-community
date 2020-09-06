require 'rails_helper'
describe Message do
  describe '#create' do

    # contentが空であれば登録できないこと
    it "is invalid without a content" do
      message = Message.new(content: "")
      message.valid?
      expect(message.errors[:content]).to include("can't be blank")
    end

    # contentが101文字以上であれば登録できないこと
    it "is invalid with a content that has more than 100 characters " do
      message = Message.new(content: over_word=101.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) })
      message.valid?
      expect(message.errors[:content]).to include("is too long (maximum is 100 characters)")
    end
    
  end

end
