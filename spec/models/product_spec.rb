require 'rails_helper'
describe Product do
  describe '#create' do

    it "全部あれば通る" do
      product = build(:product)
      product.valid?
      expect(product).to be_valid
    end

    it "商品名がないとX" do
      product = build(:product, name: '')
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "値段がないとX" do
      product = build(:product, price: '')
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "商品説明がないとX" do
      product = build(:product, detail: '')
      product.valid?
      expect(product.errors[:detail]).to include("can't be blank")
    end

    it "user_idがないとX" do
      product = build(:product, user_id: '')
      product.valid?
      expect(product.errors[:user_id]).to include("can't be blank")
    end

    it "condition_idがないとX" do
      product = build(:product, condition_id: '')
      product.valid?
      expect(product.errors[:condition_id]).to include("can't be blank")
    end

    it "shipping_fee_idがないとX" do
      product = build(:product, shipping_fee_id: '')
      product.valid?
      expect(product.errors[:shipping_fee_id]).to include("can't be blank")
    end

    it "shipping_method_idがないとX" do
      product = build(:product, shipping_method_id: '')
      product.valid?
      expect(product.errors[:shipping_method_id]).to include("can't be blank")
    end

    it "prefecture_idがないとX" do
      product = build(:product, prefecture_id: '')
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end

    it "deliveryday_idがないとX" do
      product = build(:product, deliveryday_id: '')
      product.valid?
      expect(product.errors[:deliveryday_id]).to include("can't be blank")
    end

    it "category_idがないとX" do
      product = build(:product, category_id: '')
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "statusがないとX" do
      product = build(:product, status: '')
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "nameが41文字以上だとX" do
      product = build(:product, name: '12345678901234567890123456789012345678901')
      product.valid?
      expect(product.errors[:name][0]).to include("is too long")
    end
    
    it "nameが40文字以内だとO" do
      product = build(:product, name: '1234567890123456789012345678901234567890')
      product.valid?
      expect(product).to be_valid
    end
    
    it "detailが1001文字以上だとX" do
      product = build(:product, detail: '親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）親譲りの無鉄砲で小供の時から損ばかりしてる')
      product.valid?
      expect(product.errors[:detail][0]).to include("is too long")
    end

    it "priceが全角数字だとX" do
      product = build(:product, price: '１')
      product.valid?
      expect(product.errors[:price]).to include("は半角数字で入力してください")
    end

    it "priceが2文字以下だとX" do
      product = build(:product, price: '11')
      product.valid?
      expect(product.errors[:price]).to include("は半角数字で入力してください")
    end

    it "priceが8文字以上だとX" do
      product = build(:product, price: '12345678')
      product.valid?
      expect(product.errors[:price]).to include("は半角数字で入力してください")
    end

    it "priceが3文字以上ならO" do
      product = build(:product, price: '123')
      product.valid?
      expect(product).to be_valid
    end

    it "priceが7文字以内ならO" do
      product = build(:product, price: '1234567')
      product.valid?
      expect(product).to be_valid
    end
  end
end