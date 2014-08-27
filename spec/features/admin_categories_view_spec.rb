require 'feature_helper'

describe "admin_categories", type: :feature do
  before(:each) do

    @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
                        first_name: "admin", last_name: "whatever", role: "admin")

    Category.create(title:"Chocolate", description:"Who doesn't like chocolate? Hilter that's who.")
    Category.create(title:"Vanilla", description: "It's not as boring as white people")
    Category.create(title:"Strawberry", description: "This counts as a fruit right?")

    @categories = Category.all
    @category   = Category.new
    visit home_path
  end

  it 'shows a list of categories to the admin' do
    admin_login
    visit administrator_categories_path
    @categories.each do |category|
      expect(page).to have_content(category.title)
      expect(page).to have_content(category.description)
    end
  end

  it 'has a link to create a category' do
    admin_login
    visit administrator_categories_path
    expect(page).to have_link('Create New Category', href: new_administrator_category_path)
  end

  it 'creates a new category' do
    admin_login
    visit administrator_categories_path
    page.click_link('Create New Category')

    page.fill_in('Title', with: 'Banana')
    page.fill_in('Description', with: "Monkey's favorite fruit")

    page.click_button('Submit')

    expect(current_path).to eq(administrator_categories_path)
    expect(page).to have_content("Monkey's favorite fruit")
  end

  it 'does not create an incomplete category' do
    admin_login
    visit administrator_categories_path
    page.click_link('Create New Category')

    page.fill_in('Description', with: "Monkey's favorite fruit")

    page.click_button('Submit')

    expect(page).to have_content('Fill in all of the fields before submitting')
  end

  it 'has a link to destroy a category' do
    admin_login
    visit administrator_categories_path

    @categories.each do |category|
      expect(page).to have_link('Delete', href: administrator_category_path(category))
    end
  end

  it 'destroys a category' do
    admin_login
    visit administrator_categories_path

    category         = @categories.first
    deleted_category = category.title

    within('//table') do
      first(:link, 'Delete').click
    end

    expect(current_path).to eq(administrator_categories_path)
    expect(page).to_not have_content(deleted_category)
  end

  it 'has a link to edit a category' do
    admin_login
    visit administrator_categories_path

    @categories.each do |category|
      expect(page).to have_link('Edit', href: edit_administrator_category_path(category))
    end
  end

  it 'edits a category' do
    admin_login
    visit administrator_categories_path

    category     = @categories.first
    old_category = category.title

    within('//table') do
      first(:link, 'Edit').click
    end
    page.fill_in('Title', with: 'Chocomore')
    page.click_button('Submit')

    expect(current_path).to eq(administrator_categories_path)
    expect(page).to have_content('Chocomore')
    expect(page).to_not have_content(old_category)
  end

  it 'does not edit an incomplete category' do
    admin_login
    visit administrator_categories_path

    category     = @categories.first
    old_category = category.title

    within('//table') do
      first(:link, 'Edit').click
    end
    page.fill_in('Title', with: '')
    page.click_button('Submit')

    expect(page).to have_content('Fill in all of the fields before submitting')
  end
end
