require 'availability'

class Booking
  attr_reader :availability
  
  def initialize
    file = open("availability.rb", "r")
    @availability = JSON.parse(file.read)
  end
end
