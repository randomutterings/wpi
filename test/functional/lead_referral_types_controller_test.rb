require 'test_helper'

class LeadReferralTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => LeadReferralType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    LeadReferralType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    LeadReferralType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to lead_referral_type_url(assigns(:lead_referral_type))
  end
  
  def test_edit
    get :edit, :id => LeadReferralType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    LeadReferralType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => LeadReferralType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    LeadReferralType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => LeadReferralType.first
    assert_redirected_to lead_referral_type_url(assigns(:lead_referral_type))
  end
  
  def test_destroy
    lead_referral_type = LeadReferralType.first
    delete :destroy, :id => lead_referral_type
    assert_redirected_to lead_referral_types_url
    assert !LeadReferralType.exists?(lead_referral_type.id)
  end
end
