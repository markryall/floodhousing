require 'test_helper'

class AccomodationsControllerTest < ActionController::TestCase
  setup do
    @accomodation = accomodations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accomodations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accomodation" do
    assert_difference('Accomodation.count') do
      post :create, :accomodation => @accomodation.attributes
    end

    assert_redirected_to accomodation_path(assigns(:accomodation))
  end

  test "should show accomodation" do
    get :show, :id => @accomodation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accomodation.to_param
    assert_response :success
  end

  test "should update accomodation" do
    put :update, :id => @accomodation.to_param, :accomodation => @accomodation.attributes
    assert_redirected_to accomodation_path(assigns(:accomodation))
  end

  test "should destroy accomodation" do
    assert_difference('Accomodation.count', -1) do
      delete :destroy, :id => @accomodation.to_param
    end

    assert_redirected_to accomodations_path
  end
end
