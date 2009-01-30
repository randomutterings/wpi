require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Agent.new.valid?
  end
end
