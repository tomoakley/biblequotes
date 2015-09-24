require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "testuser", email: "user@example.com", id: 1781, password: "changeme", password_confirmation: "changeme")
    @quote = @user.quotes.build(text: "Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod.", title: "Hello World")
  end

  test "should be valid" do
    assert @quote.valid?
  end

  test "user id should be present" do
    @quote.user_id = nil
    assert_not @quote.valid?
  end

  test "text should be present" do
    @quote.text = "   "
    assert_not @quote.valid?
  end

  test "text should be at most 140 characters" do
    @quote.text = "a" * 141
    assert_not @quote.valid?
  end

  test "order should be most recent first" do
    assert_equal quotes(:most_recent), Quote.first
  end

  test "associated quotes should be destroyed" do
    @user.save!
    @user.quotes.create!(text: "Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod.", title: "Hello World")
    assert_difference 'Quote.count', -2 do
      @user.destroy
    end
  end
end
