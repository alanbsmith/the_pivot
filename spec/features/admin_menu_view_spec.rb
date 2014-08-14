require 'feature_helper'

describe "admin_menu", type: :feature do
  before(:each) do
    Item.create(title:"Chocolate yummy yumm", description: "Chocolate so good you'll wanna slap yo mama", price: 400, photo: "icecreamslug.com", status: "active")
    Item.create(title:"Vanilla willya please", description: "Vanilla is the bomb for you mom!", price: 325, photo: "icecreamslug.com", status: "active")
    Item.create(title:"Strawberry berry tasty", description: "Strawbeeeeeerrrry! Is good for me!", price: 450, photo: "icecreamslug.com", status: "active")

    @items =  Item.all

    # Category.create(title:"Chocolate", description:"Who doesn't like chocolate? Hilter that's who.")
    # Category.create(title:"Vanilla", description: "It's not as boring as white people")
    # Category.create(title:"Strawberry", description: "This counts as a fruit right?")
    #
    # @categories = Category.all
    visit administrator_items_path
  end

  it "shows the items to an admin" do
    @items.each do |item|
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
      # expect(page).to have_image(item.photo) come back to this...
    end
  end

  it 'has a links to edit the items' do
    @items.each do |item|
      expect(page).to have_link('Edit', href: edit_administrator_item_path(item))
    end
  end

  it 'edits an item' do
    pending
    item     = @items.first
    old_item = item.title

    within('//table') do
      first(:link, 'Edit').click
    end
    page.fill_in('Title', with: 'Chocolate Monkey Madness')
    page.click_button('Update Item')

    expect(current_path).to eq(administrator_items_path)
    expect(page).to have_content('Chocolate Monkey Madness')
    expect(page).to_not have_content(old_item)
  end

  it 'has a link to add an item' do
    expect(page).to have_link('Create New Item', href: new_administrator_item_path)
  end

  it 'creates a new item' do
    page.click_link('Create New Item')
    page.fill_in('Title', with: 'Bananaramma you full of goodness')
    page.fill_in('Description', with: "Don't be so dirty! It's just bananas and cream")
    page.fill_in('Price', with: '450')
    page.click_button('Create this Item')

    expect(current_path).to eq(administrator_items_path)
    expect(page).to have_content('Bananaramma you full of goodness')
  end

  it 'has a select menu to change the status of the item' do
    expect(page).to have_select('status')
  end

  it 'changes the status of an item' do
    pending
  end

  it 'has a multi-select menu to add categories to an item' do
    expect(page).to have_select('category')
  end

  it 'adds and removes items from a category' do
    pending
  end
end
