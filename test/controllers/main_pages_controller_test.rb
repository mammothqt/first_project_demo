require 'test_helper'

class MainPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get main_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get main_pages_help_url
    assert_response :success
  end

  test "should get about" do
    get main_pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get main_pages_contact_url
    assert_response :success
  end

end
