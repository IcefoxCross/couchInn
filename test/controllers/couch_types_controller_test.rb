require 'test_helper'

class CouchTypesControllerTest < ActionController::TestCase
  setup do
    @couch_type = couch_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:couch_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create couch_type" do
    assert_difference('CouchType.count') do
      post :create, couch_type: { name: @couch_type.name }
    end

    assert_redirected_to couch_type_path(assigns(:couch_type))
  end

  test "should show couch_type" do
    get :show, id: @couch_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @couch_type
    assert_response :success
  end

  test "should update couch_type" do
    patch :update, id: @couch_type, couch_type: { name: @couch_type.name }
    assert_redirected_to couch_type_path(assigns(:couch_type))
  end

  test "should destroy couch_type" do
    assert_difference('CouchType.count', -1) do
      delete :destroy, id: @couch_type
    end

    assert_redirected_to couch_types_path
  end
end
