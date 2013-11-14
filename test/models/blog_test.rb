require "test_helper"

class BlogTest < ActiveSupport::TestCase

  def setup
    @blog = Blog.new
  end

  def test_valid
    assert @blog.valid?
  end

end
