require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      # create sports as new category 
      post categories_path, params: { category: { name: "Sports"} }
      #  and then check if after creation it redirects you as it supposed to do in real app
      assert_response :redirect
    end
    #  then check if link is correct 
    follow_redirect!
    assert_response :success
    # check the name in the body of html page
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " "} }
    end
    # assert_match looks for word errors in the html body
    assert_match "following errors", response.body
    assert_select 'div.field_with_errors'
  end

end
