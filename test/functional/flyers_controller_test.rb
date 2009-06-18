require 'test_helper'

class FlyersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Flyer.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Flyer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Flyer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to flyer_url(assigns(:flyer))
  end
  
  def test_edit
    get :edit, :id => Flyer.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Flyer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Flyer.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Flyer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Flyer.first
    assert_redirected_to flyer_url(assigns(:flyer))
  end
  
  def test_destroy
    flyer = Flyer.first
    delete :destroy, :id => flyer
    assert_redirected_to flyers_url
    assert !Flyer.exists?(flyer.id)
  end
end
