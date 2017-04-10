require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a id, nickname, email, password, password_confirmation" do
      user = build_stubbed(:user)
      expect(user).to be_valid
    end
    it "is invalid without a name" do
     user =  build(:user, name: nil)
     user.valid?
     expect(user.errors[:name]).to include("を入力してください。")
    end
    it "is invalid without email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end
    it "is invalid withaout password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end
  end
end
