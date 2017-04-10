require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a id, nickname, email, password, password_confirmation" do
      user = build_stubbed(:user)
      expect(user).to be_valid
    end
    it "is invalid without a name" do
     user =  build(:user, name: "")
     user.valid?
     expect(user.errors[:name]).to include("を入力してください。")
    end
  end
end
