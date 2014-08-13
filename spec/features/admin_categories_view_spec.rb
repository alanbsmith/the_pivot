require 'feature_helper'

describe "admin_categories", type: :feature do
  before(:each) do
    Category.create(title:"Chocolate", description:"Who doesn't like chocolate? Hilter that's who.")
    Category.create(title:"Vanilla", description: "It's not as boring as white people")
    Category.create(title:"Strawberry", description: "This counts as a fruit right?")

    @categories =  Category.all
    visit administrator_categories_path
  end

  it 'has a list of categories to the admin' do
    @categories.each do |category|
      expect(page).to have_content(category.title)
      expect(page).to have_content(category.description)
    end
  end

  it 'has a link to create a category' do
    expect(page).to have_link('Create New Category', href: new_administrator_category_path)
  end

  it 'has a button to destroy a category' do
    @categories.each do |category|
      expect(page).to have_link('Delete', href: category_path(category))
    end
  end

  it 'has a link to edit a category' do
    @categories.each do |category|
      expect(page).to have_link('Edit', href: edit_administrator_category_path(category))
    end
  end

end
