require 'rails_helper'

describe User do
  describe '#create' do

    #入力項目が空ではないか
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname])
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email])
    end

    #nickname 10文字以内なら登録
    it "is valid with a nickname that has less than 20 characters" do
      user = build(:user, nickname: 'aaaaaaaaaa')
      expect(user).to be_valid
    end

    #nickname 10文字以上なら登録できない
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: 'aaaaaaaaaaa')
      user.valid?
      expect(user.errors[:nickname])
    end

    #nickname 重複した場合登録できない
    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname])
    end

    #emailが適切なフォーマットであるか
    it "is valid with a email wrong format" do
      user = build(:user, email: "11111111")
      user.valid?
      expect(user.errors[:email])
    end

    #emailが重複した場合登録できない
    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email])
    end

  end
end
