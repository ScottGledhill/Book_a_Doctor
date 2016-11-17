require 'model'
require 'json'

class Booking
  attr_reader :availability

  def initialize
    access_file
    add_file_to_database
  end

  def access_file
    file = open("availability.rb", "r")
    @availability = JSON.parse(file.read)
  end

  def add_file_to_database
    availability["availability_slots"].each do |avail|
      DoctorAvailablity.create(:time => avail["time"], :availability => true, :slot_size => avail["slot_size"], :doctor_id => avail["doctor_id"])
    end
  end
end
