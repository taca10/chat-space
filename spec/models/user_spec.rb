require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid user" do
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
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build_stubbed(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します。")
    end
    it "is invalid with a name that has more than 7 characters " do
      user = build(:user, name: "aaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("は6文字以内で入力してください。")
    end
    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください。")
    end
    it "is invalid with a password no match password_confirmation " do
      user = build(:user, password: "00000000", password_confirmation: "00000001")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end
  end
end
