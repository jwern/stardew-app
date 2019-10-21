require 'test_helper'

class GameTest < ActiveSupport::TestCase

  def setup
    @game = Game.new(name: "Example Game")
  end

  test "should be valid" do
    assert @game.valid?
  end

  test "should not save game without a name" do
    @game.name = ""
    assert_not @game.save
  end

  test "game names should be unique" do
    duplicate_game = @game.dup
    duplicate_game.name = @game.name.upcase
    @game.save
    assert_not duplicate_game.valid?
  end
end
