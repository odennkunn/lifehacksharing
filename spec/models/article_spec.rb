require 'rails_helper'

describe Article do
  describe '#create' do

    # 項目がからではないか
    it "is invalid without a title" do
      article = build(:article, title: nil)
      article.valid?
      expect(article.errors[:title])
    end

    it "is invalid without a text" do
      article = build(:article, text: nil)
      article.valid?
      expect(article.errors[:text])
    end

    it "is invalid without a image" do
      article = build(:article, image: nil)
      article.valid?
      expect(article.errors[:image])
    end

  end
end
