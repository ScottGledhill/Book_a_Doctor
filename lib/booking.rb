require 'doctor_availability'
require 'json'

class Booking
  attr_reader :data

  def initialize
    access_file
    add_file_to_database
  end

  def book_available_slot(time_request)
    check_availability(time_request)
  end

  private

  def check_availability(time_request)
    requested_slot = DoctorAvailability.first(:time => time_request)
    if requested_slot.availability == true
      requested_slot.update(:availability => false)
      "Booked at #{requested_slot.time} with doctor #{requested_slot.doctor_id}"
    else
      next_available_slot(requested_slot)
    end
  end

  def next_available_slot(requested_slot)
    next_available = DoctorAvailability.get(requested_slot.id + 1)
    next_available.update(:availability => false)
    "Booked at #{next_available.time} with doctor #{next_available.doctor_id}"
  end

  def access_file
    file = open("data.rb", "r")
    @data = JSON.parse(file.read)
  end

  def add_file_to_database
    data["availability_slots"].each do |avail|
      DoctorAvailability.create(:time => avail["time"],
      :availability => true,
      :slot_size => avail["slot_size"],
      :doctor_id => avail["doctor_id"])
    end
  end
end
