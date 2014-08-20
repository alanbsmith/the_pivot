# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "============= Seeding Data Start ============="

item1 = Item.create(title: "Vanillisimo",
                    description: "The secret to the richer and creamier vanilla
                    flavor is the French custard base in this ice cream.",
                    price: 299,
                    status: 1)

item2 = Item.create(title:       "Fudge Vanilla",
                    description: " Our delicious traditional vanilla ice cream
                    with a chocolate fudge sauce rippled throughout.",
                    price:       249,
                    status:      1)

item3 = Item.create(title:       "Chocolate",
                    description: "A hit with the kids and one of our Top 10
                    flavors, our rich chocolate is made with real cocoa
                    powder.",
                    price:       199,
                    status:      1)

item4 = Item.create(title:       "Chocolate Almond",
                    description: "Our popular chocolate ice cream with fresh
                    roasted almonds pieces sprinkled throughout.",
                    price:       249,
                    status:      1)

item5 = Item.create(title:       "Rocky Road",
                    description: "Similar to Chocolate Almond ice cream, Rocky
                    Road also has mini marshmallows mixed in.",
                    price:       249,
                    status:      1)

item6 = Item.create(title:       "Chocolate Marshmallow",
                    description: "This chocolate based ice cream has a
                    marshmallow sauce gently folded in.",
                    price:       249,
                    status:      1)

item7 = Item.create(title:       "Chocolate Peanut Butter",
                    description: "One of our Top 10 flavors, this chocolate ice
                    cream features a dense peanut butter ripple throughout.",
                    price:       249,
                    status:      1)

item8 = Item.create(title:       "Chocolate Chip",
                    description: " A classic flavor, this vanilla ice cream has
                    dark chocolate shavings in it.",
                    price:       249,
                    status:      1)

item9 = Item.create(title:       "Mint Chocolate Chip",
                    description: "This refreshing light green mint ice cream is
                    one of our Top 10 flavors and has slivers of rich dark
                    chocolate all through it.",
                    price:       249,
                    status:      1)

item10 = Item.create(title:      "Peppermint Stick",
                    description: "Available year-round, this pink peppermint
                    ice cream has tiny pieces of peppermint candies sprinkled
                    in.",
                    price:       249,
                    status:      1)

item11 = Item.create(title:      "Buckeye",
                    description: " One of our Top 10 flavors, we take peanut
                    butter ice cream and ripple in chocolate sauce and mini
                    buckeye candies.",
                    price:       249,
                    status:      1)

item12 = Item.create(title:      "Moose Tracks",
                    description: "Similar to Buckeye and a Top 10 favorite,
                    this vanilla based flavor has a chocolate ripple and mini
                    peanut butter cups in it.",
                    price:       249,
                    status:      1)

item13 = Item.create(title:      "Cookies 'N' Cream",
                    description: "We add lots of sandwich cookie pieces to our
                    vanilla ice cream to create this classic flavor.",
                    price:       249,
                    status:      1)

item14 = Item.create(title:      "Peanut Butter",
                    description: "This creamy flavor has lots of peanut butter
                    sauce and our famous crushed nuts in it, to give it a rich
                    peanutty taste.",
                    price:       249,
                    status:      1)

item15 = Item.create(title:      "Cookie Dough",
                    description: "We start with cookie dough flavored ice cream
                    and mix in bits of chocolate chip cookie dough and mini
                    chocolate morsels.",
                    price:       249,
                    status:      1)

item16 = Item.create(title:      "Toffee Caramel Crunch",
                    description: "Another one of our Top 10 flavors, this
                    toffee based ice cream has a rich caramel swirl with
                    slivers of almond and chocolate toffee pieces in it.",
                    price:       249,
                    status:      1)

item17 = Item.create(title:      "Coffee",
                    description: "This one will give you a caffeine kick since
                    it’s flavored with fresh ground coffee.",
                    price:       249,
                    status:      1)

item18 = Item.create(title:      "Strawberry",
                    description: "With ripe chunks of strawberries blended
                    throughout, this fruity flavor is a big seller year round.",
                    price:       249,
                    status:      1)

item19 = Item.create(title:      "Strawberry Cheescake",
                    description: "A cheesecake flavored ice cream with our
                    chunky strawberry sauce marbled in.",
                    price:       249,
                    status:      1)

item20 = Item.create(title:      "Lemon Custard",
                    description: "This French custard based ice cream has a
                    tangy lemon flavor.",
                    price:       249,
                    status:      1)

category1 = Category.create(title: "Rockanillas",
                            description: "Yellow is the new black")

category2 = Category.create(title: "Chocolate Yumm Yumm",
                            description: "The flavor of love")

category3 = Category.create(title: "Strawbellisima",
                            description: "Pink for you")

category4 = Category.create(title: "Animalism!",
                            description: "Flavors from the farm")

category5 = Category.create(title: "Badass",
                            description: "Just for real rockstars")


# categorization1  = Categorization.create(item_id: 1 ,
#                                         category_id: 1  )
#
# categorization2  = Categorization.create(item_id: 2 ,
#                                         category_id: 1 )
#
# categorization3  = Categorization.create(item_id: 3 ,
#                                         category_id: 1 )
#
# categorization4  = Categorization.create(item_id: 4 ,
#                                         category_id: 2 )
#
# categorization5  = Categorization.create(item_id: 5 ,
#                                         category_id: 2 )
#
# categorization6  = Categorization.create(item_id: 6 ,
#                                         category_id: 2 )
#
# categorization7  = Categorization.create(item_id: 7 ,
#                                         category_id: 3 )
#
# categorization8  = Categorization.create(item_id: 8 ,
#                                         category_id: 3 )
#
# categorization9  = Categorization.create(item_id: 9 ,
#                                         category_id: 3 )
#
# categorization10 = Categorization.create(item_id: 10 ,
#                                         category_id: 4 )
#
# categorization11 = Categorization.create(item_id: 11 ,
#                                         category_id: 4 )
#
# categorization12 = Categorization.create(item_id: 12 ,
#                                         category_id: 4 )
#
# categorization13 = Categorization.create(item_id: 13 ,
#                                         category_id: 4 )
#
# categorization14 = Categorization.create(item_id: 14 ,
#                                         category_id: 4 )
#
# categorization15 = Categorization.create(item_id: 15 ,
#                                         category_id: 5 )
#
# categorization16 = Categorization.create(item_id: 16 ,
#                                         category_id: 5 )
#
# categorization17 = Categorization.create(item_id: 17 ,
#                                         category_id: 5 )
#
# categorization18 = Categorization.create(item_id: 18 ,
#                                         category_id: 5 )
#
# categorization19 = Categorization.create(item_id: 19 ,
#                                         category_id: 5 )
#
# categorization20 = Categorization.create(item_id: 20 ,
#                                         category_id: 5 )
#

puts "============= Seeding Data End ============="
