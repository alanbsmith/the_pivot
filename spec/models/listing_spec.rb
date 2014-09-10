require 'rails_helper'

RSpec.describe Listing, :type => :model do
  let(:listing) do
    Listing.create!(
      title: 'Barista',
      description: 'Grinding dem beans',
      pay_rate: '8.00/hr',
      job_type: 'part-time',
      positions: 1,
      closing: Time.new(2014, 9, 24, 12, 0, 0),
      user_id: 1
    )
  end

  it 'is valid' do
    expect(listing).to be_valid
  end

  it 'is invalid without a title' do
    listing.title = nil
    expect(listing).not_to be_valid
  end

  it 'is invalid without a description' do
    listing.description = nil
    expect(listing).not_to be_valid
  end

  it 'is invalid without a job_type' do
    listing.job_type = nil
    expect(listing).not_to be_valid
  end

  #make a test for not allowing a less than 1 positions open


end
