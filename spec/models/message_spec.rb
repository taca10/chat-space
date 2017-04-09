require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without a text" do
     message = build(:message, text: "")
     message.valid?
     expect(message.errors[:text]).to include("を入力してください。")
    end
  end
end
