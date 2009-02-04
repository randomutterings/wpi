require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Listing.new.valid?
  end
end
