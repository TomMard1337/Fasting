require "test_helper"

class AddfastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addfast = addfasts(:one)
  end
 
  test "should get index" do
    get addfasts_url
    assert_response :success
  end

  test "should get new" do
    get new_addfast_url
    assert_response :success
  end

  test "should create addfast" do
    assert_difference("Addfast.count") do
      post addfasts_url, params: { addfast: { DateAndTime: @addfast.DateAndTime, Name: @addfast.Name } }
    end

    assert_redirected_to addfast_url(Addfast.last)
  end

  test "should show addfast" do
    get addfast_url(@addfast)
    assert_response :success
  end

  test "should get edit" do
    get edit_addfast_url(@addfast)
    assert_response :success
  end

  test "should update addfast" do
    patch addfast_url(@addfast), params: { addfast: { DateAndTime: @addfast.DateAndTime, Name: @addfast.Name } }
    assert_redirected_to addfast_url(@addfast)
  end

  test "should destroy addfast" do
    assert_difference("Addfast.count", -1) do
      delete addfast_url(@addfast)
    end

    assert_redirected_to addfasts_url
  end
end
