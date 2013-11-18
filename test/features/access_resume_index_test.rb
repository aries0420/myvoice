require "test_helper"

feature "A a site visitor, I want to see a developer's resume" do
  scenario "resume index first loading up", js: true do
    visit resumes_path
    page.text.must_include "Work Experience"
  end
end
