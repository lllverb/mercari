require 'rails_helper'
describe User do
  describe '#create' do
    it "全部あれば通る" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
    it "ニックネームがないとX" do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailがないとX" do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "passwordがないとX" do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "last_nameがないとX" do
      user = build(:user, last_name: '')
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it "first_nameがないとX" do
      user = build(:user, first_name: '')
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "last_name_kanaがないとX" do
      user = build(:user, last_name_kana: '')
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    it "first_name_kanaがないとX" do
      user = build(:user, first_name_kana: '')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "last_name_kanaがカタカナじゃないとX" do
      user = build(:user, last_name_kana: 'a')
      user.valid?
      expect(user.errors[:last_name_kana]).to include("はカタカナで入力して下さい。")
    end
    it "first_name_kanaがカタカナじゃないとX" do
      user = build(:user, first_name_kana: 'a')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("はカタカナで入力して下さい。")
    end
    it "phone_numberがないとX" do
      user = build(:user, phone_number: '')
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end
    it "phone_numberがハイフンあるとX" do
      user = build(:user, phone_number: '123-456-7890')
      user.valid?
      expect(user.errors[:phone_number]).to include("は半角数字(10ケタor11ケタ)で入力してください")
    end
    it "phone_numberが全角数字あるとX" do
      user = build(:user, phone_number: '１２３４５６７８９０')
      user.valid?
      expect(user.errors[:phone_number]).to include("は半角数字(10ケタor11ケタ)で入力してください")
    end
    it "phone_numberが半角数字10ケタならO" do
      user = build(:user, phone_number: '1234567890')
      user.valid?
      expect(user).to be_valid
    end
    it "phone_numberが半角数字11ケタならO" do
      user = build(:user, phone_number: '12345678901')
      user.valid?
      expect(user).to be_valid
    end
    it "postal_codeがないとX" do
      user = build(:user, postal_code: '')
      user.valid?
      expect(user.errors[:postal_code]).to include("can't be blank")
    end
    it "postal_codeがハイフンあるとX" do
      user = build(:user, postal_code: '272-0021')
      user.valid?
      expect(user.errors[:postal_code]).to include("は半角数字7ケタ(ハイフン無し)で入力してください。")
    end
    it "postal_codeが6ケタだとX" do
      user = build(:user, postal_code: '123456')
      user.valid?
      expect(user.errors[:postal_code]).to include("は半角数字7ケタ(ハイフン無し)で入力してください。")
    end
    it "postal_codeが8ケタだとX" do
      user = build(:user, postal_code: '12345678')
      user.valid?
      expect(user.errors[:postal_code]).to include("は半角数字7ケタ(ハイフン無し)で入力してください。")
    end
    it "postal_codeが全角数字7ケタだとX" do
      user = build(:user, postal_code: '１２３４５６７')
      user.valid?
      expect(user.errors[:postal_code]).to include("は半角数字7ケタ(ハイフン無し)で入力してください。")
    end
    it "prefectureがないとX" do
      user = build(:user, prefecture: '')
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end
    it "cityがないとX" do
      user = build(:user, city: '')
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end
    it "house_numberがないとX" do
      user = build(:user, house_number: '')
      user.valid?
      expect(user.errors[:house_number]).to include("can't be blank")
    end
    it "nicknameが9文字以上だとX" do
      user = build(:user, nickname: '123456789')
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end
    it "nicknameが8文字以下だとO" do
      user = build(:user, nickname: '12345678')
      user.valid?
      expect(user).to be_valid
    end
    it "passwordが6文字未満だとX" do
      user = build(:user, password: '123456', password_confirmation: '123456')
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
    it "passwordが7文字以上だとO" do
      user = build(:user, password: '1234567', password_confirmation: '1234567')
      user.valid?
      expect(user).to be_valid
    end
    it "password_confirmationが違うとX" do
      user = build(:user, password: '1234567', password_confirmation: '7654321')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")    end
  end
end