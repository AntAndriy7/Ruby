require 'test/unit'
require_relative 'test'

class Tester < Test::Unit::TestCase
  def setup
    @organizer = Organizer.new

    @event1 = Event.new("Meeting", "2023-12-10")
    @event2 = Event.new("New Year", "2023-12-31")
    @event3 = Event.new("Test", "2023-12-04")

    @organizer.add_event(@event1)
    @organizer.add_event(@event2)
    @organizer.add_event(@event3)
  end

  def test_sort
    sorted_events = @organizer.sort
    assert_equal([@event3, @event1, @event2], sorted_events)

    sorted_events_in_range = @organizer.sort("2023-12-31", "2024-01-01")
    assert_equal([@event2], sorted_events_in_range)

    sorted_events_in_range = @organizer.sort("2023-12-30", "2023-12-31")
    assert_equal([@event2], sorted_events_in_range)

    sorted_events_in_range = @organizer.sort("2023-11-01", "2023-12-10")
    assert_equal([@event3, @event1], sorted_events_in_range)

    sorted_events_in_range = @organizer.sort("2023-12-10", "2025-10-10")
    assert_equal([@event1, @event2], sorted_events_in_range)

    sorted_events_in_range = @organizer.sort("2023-12-01", "2024-12-01")
    assert_equal([@event3, @event1, @event2], sorted_events_in_range)

    sorted_events_in_range = @organizer.sort("2024-12-01", "2025-12-01")
    assert_equal([], sorted_events_in_range)
  end

  def test_search_by_date
    searched_events = @organizer.search_by_date("2023-12-10")
    assert_equal([@event1], searched_events)

    searched_events = @organizer.search_by_date("2023-12-31")
    assert_equal([@event2], searched_events)

    searched_events = @organizer.search_by_date("2023-12-04")
    assert_equal([@event3], searched_events)
  end
end