require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item has a title" do
    item = Item.create(title: "Crickets")
    assert_equal "Crickets", item.title
  end

  test "item has a description" do
    item = Item.create(description: "Crunchy and tasty.")
    assert_equal "Crunchy and tasty.", item.description
  end

  test "item is invalid without a title" do
    item = Item.create(title: nil, description: "something")
    assert item.invalid?
  end

  test "item title is unique" do
    2.times do
      Item.create(title: "Crikets", description: "Tasty.")
    end

    result = Item.where(title: "Crikets")
    assert_equal 1, result.count
  end

  test "item is invalid without description" do
    item = Item.create(title: "something", description: nil)
    assert item.invalid?
  end

  test "item has a category" do
    category = Category.create(title: "Bugs", description: "Crunchy")
    item     = Item.create(title: "Crickets", description: "Yummy", category_id: category.id)

    assert item.category
    assert_equal category, item.category
  end
end
