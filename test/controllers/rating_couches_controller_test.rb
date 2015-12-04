require 'test_helper'

class RatingCouchesControllerTest < ActionController::TestCase
  setup do
    @rating_couch = rating_couches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_couches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_couch" do
    assert_difference('RatingCouch.count') do
      post :create, rating_couch: {  }
    end

    assert_redirected_to rating_couch_path(assigns(:rating_couch))
  end

  test "should show rating_couch" do
    get :show, id: @rating_couch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_couch
    assert_response :success
  end

  test "should update rating_couch" do
    patch :update, id: @rating_couch, rating_couch: {  }
    assert_redirected_to rating_couch_path(assigns(:rating_couch))
  end

  test "should destroy rating_couch" do
    assert_difference('RatingCouch.count', -1) do
      delete :destroy, id: @rating_couch
    end

    assert_redirected_to rating_couches_path
  end
end
