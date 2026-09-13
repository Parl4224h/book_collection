require "test_helper"

class UserBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_book = user_books(:one)
  end

  test "root displays user books" do
    get root_url
    assert_response :success
    assert_select "h1", "User Books"
  end

  test "new assignment form uses user and book select boxes" do
    get new_user_book_url
    assert_response :success
    assert_select "select#user_id_select_box"
    assert_select "select#book_id_select_box"
  end

  test "should create user book" do
    assert_difference("UserBook.count") do
      post user_books_url, params: { user_book: { user_id: users(:two).id, book_id: books(:one).id } }
    end

    assert_redirected_to user_books_url
  end
end
