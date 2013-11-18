require "test_helper"

feature "Can Access Home Page" do
  scenario "has content", js: true do
    visit root_path # Visited with JavaScript driver
    assert page.has_content?("/")
  end
end
