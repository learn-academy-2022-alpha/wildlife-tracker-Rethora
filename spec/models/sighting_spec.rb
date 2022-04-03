require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it ('should be invalid with no latitude') do
    sighting = Sighting.create(date: Date.today, longitude: 420)
    expect(sighting.errors[:latitude]).to_not be_empty
  end
  it ('should be invalid with no longitude') do
    sighting = Sighting.create(date: Date.today, latitude: 69)
    expect(sighting.errors[:longitude]).to_not be_empty
  end
  it ('should be invalid with no date') do
    sighting = Sighting.create(longitude: 420, latitude: 69)
    expect(sighting.errors[:date]).to_not be_empty
  end
end
