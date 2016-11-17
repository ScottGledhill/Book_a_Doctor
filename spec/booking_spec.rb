require 'booking'

describe Booking do
  subject(:booking) {described_class.new}

  it 'loads availability file when class created' do
    expect(p booking.availability).to include {"availability_slots"}
  end
end
