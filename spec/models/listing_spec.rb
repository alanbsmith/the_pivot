require 'rails_helper'

RSpec.describe Listing, :type => :model do
  let(:listing) do
    default_job_listing
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
    listing.employment_type = nil
    expect(listing).not_to be_valid
  end
end
