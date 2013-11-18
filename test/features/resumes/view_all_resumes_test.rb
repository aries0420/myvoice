require "test_helper"

feature "As the site visitor, I want to see a developer's resume" do
  scenario "viewing all resumes", js: true do
    # Given a a couple of resumes (loaded from fixtures)
    # When I visit /resumes
    visit resumes_path
    # Then I should see a list of resumes
    page.text.must_include "Work Experience"
  end
end
