require 'test_helper'

class FlyerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Flyer.new.valid?
  end
end
