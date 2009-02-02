require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Email.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Email.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Email.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to email_url(assigns(:email))
  end
  
  def test_edit
    get :edit, :id => Email.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Email.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Email.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Email.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Email.first
    assert_redirected_to email_url(assigns(:email))
  end
  
  def test_destroy
    email = Email.first
    delete :destroy, :id => email
    assert_redirected_to emails_url
    assert !Email.exists?(email.id)
  end
end
