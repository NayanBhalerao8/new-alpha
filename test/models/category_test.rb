require 'test_helper'

class CategoryTest < ActiveSupport::TestCase 
    test "category should be valid" do
        @category = Category.new(name: "sporta")
        assert @category.valid?
    end

    test "name should be present" do
        @category = CategoryTest.new(name: " ")
        assert_not @category.valid?
    end
end