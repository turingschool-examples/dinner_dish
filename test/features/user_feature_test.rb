require 'test_helper'

class UserFeatureTest < ActionDispatch::IntegrationTest
  test "user can visit root" do
    visit '/'
    assert page
  end

  test "user can see all created items" do
    Item.create(title: "Crickets", description: "Yummy")

    visit '/'
    assert page.has_content? "Crickets"
  end

  test "user can visit an item page" do
    item = Item.create(title: "Crickets", description: "Yummy")

    visit '/'
    click_link "item-#{item.id}"
    save_and_open_page
    assert page.has_content? "Crickets"
  end
end
