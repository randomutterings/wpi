require 'test_helper'

class LeadsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Lead.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Lead.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Lead.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to lead_url(assigns(:lead))
  end
  
  def test_edit
    get :edit, :id => Lead.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Lead.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Lead.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Lead.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Lead.first
    assert_redirected_to lead_url(assigns(:lead))
  end
  
  def test_destroy
    lead = Lead.first
    delete :destroy, :id => lead
    assert_redirected_to leads_url
    assert !Lead.exists?(lead.id)
  end
end
