require "rails_helper"

RSpec.describe "Books", type: :request do
  let(:attributes) do
    {
      title: "Kindred",
      author: "Octavia E. Butler",
      price: "14.99",
      published_date: "1979-06-01"
    }
  end

  it "adds a titled book and displays the success flash notice" do
    expect { post books_path, params: { book: attributes } }.to change(Book, :count).by(1)

    expect(response).to redirect_to(books_path)
    follow_redirect!
    expect(response.body).to include("Book was successfully added.")
  end

  it "rejects a blank title and displays the rainy-day flash notice" do
    expect { post books_path, params: { book: attributes.merge(title: "") } }.not_to change(Book, :count)

    expect(response).to have_http_status(:unprocessable_content)
    expect(response.body).to include("Book could not be added. Title can&#39;t be blank")
  end

  it "persists the author submitted through the integration endpoint" do
    post books_path, params: { book: attributes }

    expect(Book.last.author).to eq("Octavia E. Butler")
  end

  it "persists the price submitted through the integration endpoint" do
    post books_path, params: { book: attributes }

    expect(Book.last.price).to eq(14.99)
  end

  it "persists the published date submitted through the integration endpoint" do
    post books_path, params: { book: attributes }

    expect(Book.last.published_date).to eq(Date.new(1979, 6, 1))
  end
end
