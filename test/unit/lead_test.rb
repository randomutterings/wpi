require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Lead.new.valid?
  end
end
