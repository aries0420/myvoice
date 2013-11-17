require "test_helper"

class ResumeTest < ActiveSupport::TestCase

  def setup
    @resume = Resume.new
  end

  def test_valid
    assert @resume.valid?
  end

end
