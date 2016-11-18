require 'booking'
require 'database_cleaner'

describe Booking do

  subject(:booking) {described_class.new}

  it 'loads availability file when class created' do
    expect(booking.availability).to include {"availability_slots"}
  end

  it 'can check availability and return the booking time' do
    expect(booking.check_availability('08:00:00')).to eq '08:00:00'
    expect(booking.check_availability('14:00:00')).to eq '14:00:00'
  end

  it 'cannot book if availability is false' do
    booking.check_availability('14:00:00')
    expect{ booking.check_availability('14:00:00') }.to raise_error 'slot already booked'
  end

  it 'books the next available slot if availability is false' do
    booking.check_availability('14:00:00')
    expect(booking.check_availability('14:00:00').to eq '14:10:00'
  end
end
