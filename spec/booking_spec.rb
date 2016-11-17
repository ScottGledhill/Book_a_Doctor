require 'booking'

describe Booking do
  subject(:booking) {described_class.new}

  it 'loads availability file when class created' do
    expect(booking.availability).to include {"availability_slots"}
  end

  it 'can check availability and return the booking time' do
    expect(booking.check_availability('08:00:00')).to eq '08:00:00'
  end
end
