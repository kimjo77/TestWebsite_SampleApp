require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "diplay title helper" do
    assert_equal display_title,         "Ruby on Rails Chapter 3"
    assert_equal display_title("Help"), "Help | Ruby on Rails Chapter 3"
  end
end