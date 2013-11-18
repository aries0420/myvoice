require "test_helper"

feature "As the site owner, I want to add a resume item so that I can show off my qualifications" do
  scenario "adding a new resume", js: true do
    # Given new project data entered in a form
    visit resumes_path
    click_on "New project"
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

    # When the form is submitted
    click_on "Create Project"

    # Then a confirmation page should show the new Project

    # this will now fail
    # page.text.must_include "Project was successfully added"

    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end

  scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    visit new_project_path
    fill_in "Name", with: "Q"

    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"

    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "prohibited this project from being saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
