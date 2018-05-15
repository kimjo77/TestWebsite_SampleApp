require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:John)
    # This code is not idiomatically correct.
    # @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 210 characters" do
    @micropost.content = "a" * 211
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

  test "should like and unlike a post" do
    post = microposts(:orange)
    archer  = users(:Archer)
    assert_not archer.likes?(post)
    archer.like(post)
    assert archer.likes?(post)
    archer.unlike(post)
    assert_not archer.likes?(post)
  end
end
