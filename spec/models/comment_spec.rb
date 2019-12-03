require 'rails_helper'
describe Comment do
  describe '#create' do

    it "textがあれば投稿できる" do
      comment = build(:comment)
      comment.valid?
      expect(comment).to be_valid
    end

    it "textがないと投稿できないこと" do
      comment = build(:comment, text:"")
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

    it "textが85文字では投稿できないこと" do
      comment = build(:comment, text:"1111111111222222222233333333334444444444555555555566666666667777777777888888888899999")
      comment.valid?
      expect(comment.errors[:text]).to include("の入力は最大84文字までです")
    end

    it "textが1文字では投稿できること" do
      comment = build(:comment, text:"1")
      comment.valid?
      expect(comment).to be_valid
    end

    it "textが84文字では投稿できること" do
      comment = build(:comment, text:"111111111122222222223333333333444444444455555555556666666666777777777788888888889999")
      comment.valid?
      expect(comment).to be_valid
    end
  end
end