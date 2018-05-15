require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @vote = Vote.new(micropost_id: microposts(:orange).id,
                                     voter_id: users(:Archer).id)
  end

  test "should be valid" do
    assert @vote.valid?
  end

  test "should require a micropost_id" do
    @vote.micropost_id = nil
    assert_not @vote.valid?
  end

  test "should require a voter_id" do
    @vote.voter_id = nil
    assert_not @vote.valid?
  end
end
