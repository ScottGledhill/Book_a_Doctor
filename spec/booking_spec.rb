require 'booking'
require 'database_cleaner'

describe Booking do

  subject(:booking) {described_class.new}

  it 'loads availability file when class created' do
    expect(booking.availability).to include {"availability_slots"}
  end

  it 'can check availability and return the booking time' do
    expect(booking.book_available_slot('08:00:00')).to eq "Booked at 08:00:00 with doctor 1"
    expect(booking.book_available_slot('14:40:00')).to eq "Booked at 14:40:00 with doctor 1"
  end

  it 'books the next available slot if availability is false' do
    booking.book_available_slot('14:00:00')
    expect(booking.book_available_slot('14:00:00')).to include '14:10:00'
  end

  it 'can book with doctor 2' do
    booking.book_available_slot('14:50:00')
    expect(booking.book_available_slot('14:50:00')).to eq "Booked at 14:50:00 with doctor 2"
  end
end
