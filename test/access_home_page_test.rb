require "test_helper"

feature "Can access home page" do
  scenario "has content", js: true do
    visit root_path
    # page.text.must_include "Kangie Chan"
    assert page.has_content?("/")
  end
end
