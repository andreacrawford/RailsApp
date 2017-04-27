require "rails_helper"

describe Product do

  before do
    @product = FactoryGirl.create(:product)
    @user = FactoryGirl.create(:user)
    @product.comments.create!(rating: 1, user: @user, body: "Awful shoe!")
    @product.comments.create!(rating: 3, user: @user, body: "So-so")
    @product.comments.create!(rating: 5, user: @user, body: "LOVE THEM")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end

  it "is not valid" do 
    expect(Product.new(description: "Beautiful pink Nano")).not_to be_valid
    expect(Product.new(image_url: "http://www.roguefitness.com/media/catalog/product/cache/1/rogue_header_2015/af097278c5db4767b0fe9bb92fe21690/a/r/ar3434_lg.jpg")).not_to be_valid
  end

end