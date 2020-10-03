require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "layout links" do
   get root_path
   assert_template 'static_pages/home'
   assert_select "a[href=?]", help_path
   assert_select "a[href=?]", about_path
   assert_select "a[href=?]", contact_path
   assert_select "a[href=?]", users_path, 0
   get signup_path
   assert_select "title", full_title("Sign up")
   log_in_as @user
   follow_redirect!
   assert_select "a[href=?]", users_path, 1
  end
  
end
