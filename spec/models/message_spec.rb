require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without a text" do
     message = build(:message, text: "")
     message.valid?
     expect(message.errors[:text]).to include("を入力してください。")
    end
    it "is valid without a user_id" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください。")
    end
    it "is valid with a text" do
      message  = build_stubbed(:message)
      expect(message).to be_valid
    end
  end
end
