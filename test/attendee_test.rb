require 'minitest'
require 'minitest/autorun'
require './lib/attendee'

class AttendeeTest < MiniTest::Unit::TestCase

  def test_it_exits
    at = Attendee.new
    assert_kind_of Attendee, at
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {first_name: 'George', last_name: 'Washington', phone_number: '2024556677'}
    attendee = Attendee.new(data)
    assert_equal data[:first_name], attendee.first_name
    assert_equal data[:last_name], attendee.last_name
    assert_equal data[:phone_number], attendee.phone_number
  end

  def test_it_can_change_first_names
    data = {first_name: 'George'}
    attendee = Attendee.new(data)
    assert_equal data[:first_name], attendee.first_name
    attendee.first_name = "Thomas"
    assert_equal "Thomas", attendee.first_name
  end

  def test_it_cleans_up_phone_numbers_with_periods_and_hyphens
    attendee = Attendee.new(phone_number: "202.444.2302")
    assert_equal "2024442302", attendee.phone_number
  end

  def test_it_removes_leading_one_from_an_eleven_digit_number
    attendee = Attendee.new(phone_number: '13038877697')
    assert_equal '3038877697', attendee.phone_number
  end

  def test_if_throws_away_numbers_that_are_too_long
    attendee = Attendee.new(phone_number: '234527384943582')
    assert_equal '0000000000', attendee.phone_number
  end

  def test_it_throws_away_phone_numbers_that_are_too_short
    attendee = Attendee.new(phone_number: '123334')
    assert_equal '0000000000', attendee.phone_number
  end
end