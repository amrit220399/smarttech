require "application_system_test_case"

class StoresTest < ApplicationSystemTestCase
  setup do
    @store = stores(:one)
  end

  test "visiting the index" do
    visit stores_url
    assert_selector "h1", text: "Stores"
  end

  test "creating a Store" do
    visit stores_url
    click_on "New Store"

    fill_in "Brand", with: @store.brand
    fill_in "Color", with: @store.color
    fill_in "Configuration", with: @store.configuration
    fill_in "Description", with: @store.description
    fill_in "Launch year", with: @store.launch_year
    fill_in "Mrp", with: @store.mrp
    fill_in "Product name", with: @store.product_name
    fill_in "Product type", with: @store.product_type
    fill_in "Sell price", with: @store.sell_price
    click_on "Create Store"

    assert_text "Store was successfully created"
    click_on "Back"
  end

  test "updating a Store" do
    visit stores_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @store.brand
    fill_in "Color", with: @store.color
    fill_in "Configuration", with: @store.configuration
    fill_in "Description", with: @store.description
    fill_in "Launch year", with: @store.launch_year
    fill_in "Mrp", with: @store.mrp
    fill_in "Product name", with: @store.product_name
    fill_in "Product type", with: @store.product_type
    fill_in "Sell price", with: @store.sell_price
    click_on "Update Store"

    assert_text "Store was successfully updated"
    click_on "Back"
  end

  test "destroying a Store" do
    visit stores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store was successfully destroyed"
  end
end
