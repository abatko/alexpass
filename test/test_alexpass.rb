# encoding: utf-8
require 'test_helper'

class AlexpassTest < Test::Unit::TestCase

  def test__deprecated
    assert_equal Alexpass::DEPRECATED, Alexpass.generate
  end

end
