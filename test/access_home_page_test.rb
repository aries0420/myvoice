require "test_helper"

feature "AccessHomePage" do
  scenario "displays welcome message" do
    visit root_path
    page.text.must_include "Kangie Chan"
  end
end
