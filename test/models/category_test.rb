require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category has a title" do
    category = Category.create(title: "Crickets")
    assert_equal "Crickets", category.title
  end

  test "category has a description" do
    category = Category.create(description: "Crunchy and tasty.")
    assert_equal "Crunchy and tasty.", category.description
  end

  test "category is invalid without a title" do
    category = Category.create(title: nil, description: "something")
    assert category.invalid?
  end

  test "category title is unique" do
    2.times do
      Category.create(title: "Crikets", description: "Tasty.")
    end

    result = Category.where(title: "Crikets")
    assert_equal 1, result.count
  end

  test "category is invalid without description" do
    category = Category.create(title: "something", description: nil)
    assert category.invalid?
  end

  test "category has many items" do
    category = Category.create(title: "Crikets", description: "Tasty.")
    item     = category.items.create(title: "Something", description: "Something else.")

    assert category.items
    assert_includes category.items, item
  end
end
