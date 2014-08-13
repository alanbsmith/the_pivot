require 'rails_helper'

  describe "items/index", type: :view do
    before(:each) do
      assign(:items, [Item.create(title:"Chocolate yummy yumm", description: "Chocolate so good you'll wanna slap yo mama", price: 400, photo: "icecreamslug.com", status: "active"),
                      Item.create(title:"Vanilla willya please", description: "Vanilla is the bomb for you mom!", price: 325, photo: "icecreamslug.com", status: "active"),
                      Item.create(title:"Strawberry berry tasty", description: "Strawbeeeeeerrrry! Is good for me!", price: 450, photo: "icecreamslug.com", status: "active")
                      ])
    end

    it "has a list of items" do
      pending
      render
      assert_select "table>tr>td", text: "Chocolate yummy yumm", count: 1
      assert_select "table>tr>td", text: "Vanilla willya please", count: 1
      assert_select "table>tr>td", text: "Strawberry berry tasty", count: 1
    end
  end
