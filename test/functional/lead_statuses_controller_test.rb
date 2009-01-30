require 'test_helper'

class LeadStatusesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => LeadStatus.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    LeadStatus.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    LeadStatus.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to lead_status_url(assigns(:lead_status))
  end
  
  def test_edit
    get :edit, :id => LeadStatus.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    LeadStatus.any_instance.stubs(:valid?).returns(false)
    put :update, :id => LeadStatus.first
    assert_template 'edit'
  end
  
  def test_update_valid
    LeadStatus.any_instance.stubs(:valid?).returns(true)
    put :update, :id => LeadStatus.first
    assert_redirected_to lead_status_url(assigns(:lead_status))
  end
  
  def test_destroy
    lead_status = LeadStatus.first
    delete :destroy, :id => lead_status
    assert_redirected_to lead_statuses_url
    assert !LeadStatus.exists?(lead_status.id)
  end
end
