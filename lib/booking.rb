require 'model'
require 'json'

class Booking
  attr_reader :availability

  def initialize
    file = open("availability.rb", "r")
    @availability = JSON.parse(file.read)
    availability["availability_slots"].each do |avail|
      DoctorTimes.create(:time => avail["time"], :availability => true, :slot_size => avail["slot_size"], :doctor_id => avail["doctor_id"])
    end
  end
end
