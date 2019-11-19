require 'rails_helper'
describe Post do
  describe '#create' do

    it "pictureとtextが揃えば投稿できる" do
      post = build(:post)
      post.valid?
      expect(post).to be_valid
    end

    it "pictureがないと投稿できないこと" do
      post = build(:post, picture:"")
      post.valid?
      expect(post.errors[:picture]).to include("を入力してください")
    end

    it "textがないと投稿できないこと" do
      post = build(:post, text:"")
      post.valid?
      expect(post.errors[:text]).to include("を入力してください")
    end

    it "textが85文字では投稿できないこと" do
      post = build(:post, text:"1111111111222222222233333333334444444444555555555566666666667777777777888888888899999")
      post.valid?
      expect(post.errors[:text]).to include("の入力は最大84文字までです")
    end

    it "textが1文字では投稿できること" do
      post = build(:post, text:"1")
      post.valid?
      expect(post).to be_valid
    end

    it "textが84文字では投稿できること" do
      post = build(:post, text:"111111111122222222223333333333444444444455555555556666666666777777777788888888889999")
      post.valid?
      expect(post).to be_valid
    end
  end
end