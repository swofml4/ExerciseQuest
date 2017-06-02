require 'test_helper'

class BodypartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bodypart = bodyparts(:one)
  end

  test "should get index" do
    get bodyparts_url
    assert_response :success
  end

  test "should get new" do
    get new_bodypart_url
    assert_response :success
  end

  test "should create bodypart" do
    assert_difference('Bodypart.count') do
      post bodyparts_url, params: { bodypart: { name: @bodypart.name } }
    end

    assert_redirected_to bodypart_url(Bodypart.last)
  end

  test "should show bodypart" do
    get bodypart_url(@bodypart)
    assert_response :success
  end

  test "should get edit" do
    get edit_bodypart_url(@bodypart)
    assert_response :success
  end

  test "should update bodypart" do
    patch bodypart_url(@bodypart), params: { bodypart: { name: @bodypart.name } }
    assert_redirected_to bodypart_url(@bodypart)
  end

  test "should destroy bodypart" do
    assert_difference('Bodypart.count', -1) do
      delete bodypart_url(@bodypart)
    end

    assert_redirected_to bodyparts_url
  end
end
