require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    check "Availability" if @product.availability
    fill_in "Base price", with: @product.base_price
    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "Discount", with: @product.discount
    fill_in "Image", with: @product.image
    fill_in "Name", with: @product.name
    fill_in "Product type", with: @product.product_type
    fill_in "Size", with: @product.size
    fill_in "Stock", with: @product.stock
    fill_in "Total price", with: @product.total_price
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    check "Availability" if @product.availability
    fill_in "Base price", with: @product.base_price
    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "Discount", with: @product.discount
    fill_in "Image", with: @product.image
    fill_in "Name", with: @product.name
    fill_in "Product type", with: @product.product_type
    fill_in "Size", with: @product.size
    fill_in "Stock", with: @product.stock
    fill_in "Total price", with: @product.total_price
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
