#Variant 2

class Event
  attr_accessor :title, :date

  def initialize(title, date)
    @title = title
    @date = date
  end

  def to_s
    "#{@title} - #{@date}"
  end
end

class Organizer
  attr_accessor :events

  def initialize
    @events = []
  end

  def add_event(event)
    @events << event
  end

  def sort(start_date = nil, end_date = nil)
    sorted_events = @events.sort_by(&:date)

    if start_date && end_date
      sorted_events.select { |event| event.date.between?(start_date, end_date) }
    else
      sorted_events
    end
  end

  def search_by_date(target_date)
    @events.select { |event| event.date == target_date }
  end

  def reminders(today)
    upcoming_events = @events.select { |event| event.date >= today }

    if upcoming_events.empty?
      puts "\nNo upcoming reminders."
    else
      upcoming_events = upcoming_events.sort_by(&:date)

      puts "\nUpcoming reminders:"
      upcoming_events.each do |event|
        puts "Reminder: #{event.title} is coming up on #{event.date}"
      end
    end
  end
end

organizer = Organizer.new

event1 = Event.new("Meeting", "2023-12-10")
event2 = Event.new("New Year", "2023-12-31")
event3 = Event.new("Test", "2023-12-04")

organizer.add_event(event1)
organizer.add_event(event2)
organizer.add_event(event3)

puts "Sorted Events:"
sorted = organizer.sort
sorted.each { |event| puts event }

puts "\nSorted Events in Range:"
sorted_in_range = organizer.sort("2023-11-01", "2023-12-20")
sorted_in_range.each { |event| puts event }

puts "\nEvents on 2023-12-10:"
searched = organizer.search_by_date("2023-12-10")
searched.each { |event| puts event }

today = "2023-10-01"
organizer.reminders(today)

today = "2023-12-20"
organizer.reminders(today)

today = "2024-01-01"
organizer.reminders(today)
