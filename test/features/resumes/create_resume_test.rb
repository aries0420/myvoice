require "test_helper"

feature "As the site owner, I want to add a resume item so that I can show off my qualifications" do
  scenario "adding a new resume", js: true do
    # Given new resume data entered in a form
    visit resumes_path
    click_on "New Resume"
    fill_in "Title", with: "Code Fellows Portfolio"
    fill_in "Company", with: "Code Fellows"
    fill_in "Description", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

    # When the form is submitted
    click_on "Create Resume"

    # Then a confirmation page should show the new resume entry
    page.text.must_include "New resume entry has been added."

    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end

  # this will now fail
  scenario "new resume has invalid data" do
    # Given invalid resume data is entered in a form
    visit new_resume_path
    fill_in "Title", with: "Q"

    # When the form is submitted with a short title and missing description field
    click_on "Create Resume"

    # Then the form should be displayed again, with an error message
    current_path.must_match /resumes$/
    page.text.must_include "prohibited this entry from being saved"
    page.text.must_include "Title is too short"
    page.text.must_include "Description can't be blank"
  end
end
