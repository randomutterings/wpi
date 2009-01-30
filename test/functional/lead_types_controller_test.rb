require 'test_helper'

class LeadTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => LeadType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    LeadType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    LeadType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to lead_type_url(assigns(:lead_type))
  end
  
  def test_edit
    get :edit, :id => LeadType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    LeadType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => LeadType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    LeadType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => LeadType.first
    assert_redirected_to lead_type_url(assigns(:lead_type))
  end
  
  def test_destroy
    lead_type = LeadType.first
    delete :destroy, :id => lead_type
    assert_redirected_to lead_types_url
    assert !LeadType.exists?(lead_type.id)
  end
end
