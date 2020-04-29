require 'test_helper'

class CodeidsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get codeids_index_url
    assert_response :success
  end

  test "should get show" do
    get codeids_show_url
    assert_response :success
  end

  test "should get new" do
    get codeids_new_url
    assert_response :success
  end

  test "should get create" do
    get codeids_create_url
    assert_response :success
  end

  test "should get edit" do
    get codeids_edit_url
    assert_response :success
  end

  test "should get update" do
    get codeids_update_url
    assert_response :success
  end

  test "should get destroy" do
    get codeids_destroy_url
    assert_response :success
  end

end
