require 'rails_helper'

RSpec.describe Category, :type => :model do

  it 'is unique by title' do
    category1 = Category.create!(title: 'tech', description: 'doing stuff with computers')
    category2 = Category.create(title: 'tech', description: 'other stuff with other computers!')
    category_count = Category.all.count
    expect(category_count).to eq(1)
  end
end
