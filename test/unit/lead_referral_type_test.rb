require 'test_helper'

class LeadReferralTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LeadReferralType.new.valid?
  end
end
