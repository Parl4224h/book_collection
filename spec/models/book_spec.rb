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
    expect(book.author).to eq("Octavia E. Butler")
  end

  it "stores a non-negative numeric price" do
    expect(book).to be_valid
    expect(book.price).to eq(14.99)
  end

  it "stores a published date" do
    expect(book.published_date).to eq(Date.new(1979, 6, 1))
  end
end
