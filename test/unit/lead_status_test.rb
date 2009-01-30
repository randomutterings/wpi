require 'test_helper'

class LeadStatusTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LeadStatus.new.valid?
  end
end
