require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/violation_reader"

class ViolationReaderTest < Minitest::Test

  def test_it_exists
    v = ViolationReader.new

    assert_instance_of ViolationReader, v
  end

  def test_it_loads_the_csv
    v = ViolationReader.new

    assert_equal 545, v.data.count
  end

  def test_group_by_category_makes_hash_with_category_values
    v = ViolationReader.new
require "pry"; binding.pry
    assert_equal ["Garbage and Refuse", "Unsanitary Conditions", "Animals and Pests", "Building Conditions", "Vegetation", "Chemical Hazards", "Biohazards", "Air Pollutants and Odors", "Retail Food"], v.group_by_category.keys
  end
end
