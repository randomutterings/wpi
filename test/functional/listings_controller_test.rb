require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Listing.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Listing.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Listing.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to listing_url(assigns(:listing))
  end
  
  def test_edit
    get :edit, :id => Listing.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Listing.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Listing.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Listing.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Listing.first
    assert_redirected_to listing_url(assigns(:listing))
  end
  
  def test_destroy
    listing = Listing.first
    delete :destroy, :id => listing
    assert_redirected_to listings_url
    assert !Listing.exists?(listing.id)
  end
end
