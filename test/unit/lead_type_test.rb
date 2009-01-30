require 'test_helper'

class LeadTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LeadType.new.valid?
  end
end
