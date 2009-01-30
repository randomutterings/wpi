require 'test_helper'

class AgentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Agent.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Agent.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Agent.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to agent_url(assigns(:agent))
  end
  
  def test_edit
    get :edit, :id => Agent.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Agent.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Agent.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Agent.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Agent.first
    assert_redirected_to agent_url(assigns(:agent))
  end
  
  def test_destroy
    agent = Agent.first
    delete :destroy, :id => agent
    assert_redirected_to agents_url
    assert !Agent.exists?(agent.id)
  end
end
