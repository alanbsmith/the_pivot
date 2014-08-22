require 'feature_helper'

describe "admin_categories", type: :feature do
  before(:each) do
    Category.create(title:"Chocolate", description:"Who doesn't like chocolate? Hilter that's who.")
    Category.create(title:"Vanilla", description: "It's not as boring as white people")
    Category.create(title:"Strawberry", description: "This counts as a fruit right?")

    @categories = Category.all
    @category   = Category.new
    visit administrator_categories_path
  end

  it 'shows a list of categories to the admin' do
    @categories.each do |category|
      expect(page).to have_content(category.title)
      expect(page).to have_content(category.description)
    end
  end

  it 'has a link to create a category' do
    expect(page).to have_link('Create New Category', href: new_administrator_category_path)
  end

  it 'adds a category' do
    page.click_link('Create New Category')
    page.fill_in('Title', with: 'Banana')
    page.fill_in('Description', with: "Monkey's favorite fruit")
    page.click_button('Create this Category')

    expect(current_path).to eq(administrator_categories_path)
    expect(page).to have_content("Monkey's favorite fruit")
  end

  it 'has a link to destroy a category' do
    @categories.each do |category|
      expect(page).to have_link('Delete', href: administrator_category_path(category))
    end
  end

  it 'destroys a category' do
    category         = @categories.first
    deleted_category = category.title

    within('//table') do
      first(:link, 'Delete').click
      # click_link('Yes')
    end

    expect(current_path).to eq(administrator_categories_path)
    expect(page).to_not have_content(deleted_category)
  end

  it 'has a link to edit a category' do
    @categories.each do |category|
      expect(page).to have_link('Edit', href: edit_administrator_category_path(category))
    end
  end

  it 'edits a category' do
    category     = @categories.first
    old_category = category.title

    within('//table') do
      first(:link, 'Edit').click
    end
    page.fill_in('Title', with: 'Chocomore')
    page.click_button('Update this Category')

    expect(current_path).to eq(administrator_categories_path)
    expect(page).to have_content('Chocomore')
    expect(page).to_not have_content(old_category)
  end
end
