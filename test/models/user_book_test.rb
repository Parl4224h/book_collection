require "test_helper"

class UserBookTest < ActiveSupport::TestCase
  test "connects a user and a book" do
    assignment = user_books(:one)

    assert_includes assignment.user.books, assignment.book
    assert_includes assignment.book.users, assignment.user
  end

  test "does not allow the same book to be assigned twice to a user" do
    duplicate = UserBook.new(user: users(:one), book: books(:one))

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:user_id], "already has this book"
  end
end
