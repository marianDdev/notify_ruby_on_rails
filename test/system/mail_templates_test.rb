require "application_system_test_case"

class MailTemplatesTest < ApplicationSystemTestCase
  setup do
    @mail_template = mail_templates(:one)
  end

  test "visiting the index" do
    visit mail_templates_url
    assert_selector "h1", text: "Mail templates"
  end

  test "should create mail template" do
    visit mail_templates_url
    click_on "New mail template"

    click_on "Create Mail template"

    assert_text "Mail template was successfully created"
    click_on "Back"
  end

  test "should update Mail template" do
    visit mail_template_url(@mail_template)
    click_on "Edit this mail template", match: :first

    click_on "Update Mail template"

    assert_text "Mail template was successfully updated"
    click_on "Back"
  end

  test "should destroy Mail template" do
    visit mail_template_url(@mail_template)
    click_on "Destroy this mail template", match: :first

    assert_text "Mail template was successfully destroyed"
  end
end
