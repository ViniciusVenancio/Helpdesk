require 'test_helper'

class AmendmentsControllerTest < ActionController::TestCase
  setup do
    @amendment = amendments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amendments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amendment" do
    assert_difference('Amendment.count') do
      post :create, amendment: { contract_id: @amendment.contract_id, end_date: @amendment.end_date, number: @amendment.number, start_date: @amendment.start_date, title: @amendment.title, value: @amendment.value }
    end

    assert_redirected_to amendment_path(assigns(:amendment))
  end

  test "should show amendment" do
    get :show, id: @amendment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @amendment
    assert_response :success
  end

  test "should update amendment" do
    patch :update, id: @amendment, amendment: { contract_id: @amendment.contract_id, end_date: @amendment.end_date, number: @amendment.number, start_date: @amendment.start_date, title: @amendment.title, value: @amendment.value }
    assert_redirected_to amendment_path(assigns(:amendment))
  end

  test "should destroy amendment" do
    assert_difference('Amendment.count', -1) do
      delete :destroy, id: @amendment
    end

    assert_redirected_to amendments_path
  end
end
