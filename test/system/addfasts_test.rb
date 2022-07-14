require "application_system_test_case"

class AddfastsTest < ApplicationSystemTestCase
  setup do
    @addfast = addfasts(:one)
  end

  test "visiting the index" do
    visit addfasts_url
    assert_selector "h1", text: "Addfasts"
  end

  test "should create addfast" do
    visit addfasts_url
    click_on "New addfast"

    fill_in "Dateandtime", with: @addfast.DateAndTime
    fill_in "Name", with: @addfast.Name
    click_on "Create Addfast"

    assert_text "Addfast was successfully created"
    click_on "Back"
  end

  test "should update Addfast" do
    visit addfast_url(@addfast)
    click_on "Edit this addfast", match: :first

    fill_in "Dateandtime", with: @addfast.DateAndTime
    fill_in "Name", with: @addfast.Name
    click_on "Update Addfast"

    assert_text "Addfast was successfully updated"
    click_on "Back"
  end

  test "should destroy Addfast" do
    visit addfast_url(@addfast)
    click_on "Destroy this addfast", match: :first

    assert_text "Addfast was successfully destroyed"
  end
end
