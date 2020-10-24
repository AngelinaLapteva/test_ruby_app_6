require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # setup is going to run before each test. its reserved word
  def setup
    @category = Category.new(name: "Sports")
  end
  test "category should be valid" do
    # assret is like expect on jasmine
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    # we need to save into test table of database first one on order to compare with second object
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end