require 'doctor_availability'
require 'json'

class Booking
  attr_reader :availability

  def initialize
    access_file
    add_file_to_database
  end

  def check_availability(time_request)
    requested_slot = DoctorAvailability.first(:time => time_request)
    if requested_slot.availability == true
      requested_slot.update(:availability => false)
      requested_slot.time
    else
      raise 'slot already booked'
    end
  end

  private

  def access_file
    file = open("availability.rb", "r")
    @availability = JSON.parse(file.read)
  end

  def add_file_to_database
    availability["availability_slots"].each do |avail|
      DoctorAvailability.create(:time => avail["time"],
      :availability => true,
      :slot_size => avail["slot_size"],
      :doctor_id => avail["doctor_id"])
    end
  end
end
