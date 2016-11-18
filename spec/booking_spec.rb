require 'booking'
require 'database_cleaner'

describe Booking do

  subject(:booking) {described_class.new}

  it 'loads availability file when class created' do
    expect(booking.availability).to include {"availability_slots"}
  end

  it 'can check availability and return the booking time' do
    expect(booking.book_available_slot('08:00:00')).to eq '08:00:00'
    expect(booking.book_available_slot('14:00:00')).to eq '14:00:00'
  end

  it 'books the next available slot if availability is false' do
    booking.book_available_slot('14:00:00')
    expect(booking.book_available_slot('14:00:00')).to eq '14:10:00'
  end
end
