# encoding: utf-8
require 'test_helper'

class AlexpassTest < Test::Unit::TestCase

  def test__generate__default_length
    assert_equal Alexpass::DEFAULT_LENGTH, Alexpass.generate.length
  end

  def test__generate__random_length
    random_length = rand(20)+1
    assert_equal random_length, Alexpass.generate(:length=>random_length).length
  end

  def test__generate__raise_exception_for_non_hash_argument
    non_hash_argument = 10 
    exception = assert_raise(ArgumentError) { Alexpass.generate(non_hash_argument) }
    assert_equal "expected a Hash, but got: #{non_hash_argument}", exception.message
  end

  def test__generate__raise_exception_for_bad_memorizable_hash_value_type
    non_boolean = {:memorizable => 10}
    exception = assert_raise(ArgumentError) { Alexpass.generate(non_boolean) }
    assert_equal "expected :memorizable to be boolean, but got: #{non_boolean[:memorizable].inspect}", exception.message
  end

  def test__generate__raise_exception_for_bad_length_hash_value_type
    non_fixnum = {:length => 'A'}
    exception = assert_raise(ArgumentError) { Alexpass.generate(non_fixnum) }
    assert_equal "expected :length to be a Fixnum, but got: #{non_fixnum[:length].inspect}", exception.message
  end

  def test_raise_exception_for_fixnum_argument_less_than_one_to_generate_to_length
    fixnum_argument = {:length => 0}
    exception = assert_raise(ArgumentError) { Alexpass.generate(fixnum_argument) }
    assert_equal "expected :length > 0, but got: #{fixnum_argument[:length].inspect}", exception.message
  end

  def test__sample
    assert_equal 'a', Alexpass._sample(['a'])
    assert_equal 'a', Alexpass._sample(['a', 'a', 'a'])
    random_element = Alexpass._sample(['a', 'b', 'c'])
    assert_equal String, random_element.class
    assert_equal 1, random_element.length
  end

  def test__sample_raise_exception_for_non_array_argument
    exception = assert_raise(ArgumentError) { Alexpass._sample({}) }
    assert_equal "expected an Array, but got: Hash", exception.message
  end

  def test__sample_raise_exception_for_empty_array_argument
    exception = assert_raise(ArgumentError) { Alexpass._sample([]) }
    assert_equal "expected a non-empty Array, but got an empty one", exception.message
  end

  def test__permutations
    # these hardcoded values will need to be updated if/when the character set lengths change
    assert_equal 24640200, Alexpass.permutations
    assert_equal 40822898688, Alexpass.permutations(:memorizable => false)
    assert_equal 48048390000, Alexpass.permutations(:memorizable => true, :length => 11)
    assert_equal 373611168792576, Alexpass.permutations(:memorizable => false, :length => 11)
  end

end
