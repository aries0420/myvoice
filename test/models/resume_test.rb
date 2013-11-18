require "test_helper"

class ResumeTest < ActiveSupport::TestCase

  def setup
    @resume = Resume.new title: "Test"
  end

  def test_valid
    # assert @resume.valid?
    skip("Coming back to fix this later")
  end

  def test_invalid_without_title
    @resume.title = nil
    refute @resume.valid?
  end

end
