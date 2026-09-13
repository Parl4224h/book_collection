require "rails_helper"

RSpec.describe Book, type: :model do
  subject(:book) do
    described_class.new(
      title: "Kindred",
      author: "Octavia E. Butler",
      price: 14.99,
      published_date: Date.new(1979, 6, 1)
    )
  end

  it "requires a title (including the rainy-day blank-title case)" do
    expect(book).to be_valid

    book.title = ""

    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "stores an author" do
    book.author = nil

    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it "stores a non-negative numeric price" do
    book.price = nil

    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("is not a number")
  end

  it "stores a published date" do
    book.published_date = nil

    expect(book).not_to be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end
end
