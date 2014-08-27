puts "============= Seeding Data Start ============="

item1 = Item.create(
                    title: "Oh'yeah, Sexual Chocolate",
                    description: "Rich Mexican chocolate fudge icecream suduced by 
                                  Jose' Cuervo tequilla. It's qualified to satisfy you.",
                    price:        9.35,
                    status:       1,
                    image:        open("public/uploads/item/image/mexican_choco.jpg")
                    )

item2 = Item.create(title:       "Coffee creamy dreams",
                    description: "A classic coffee cream, hung with bit of walnut and expresso chips,
                                  infused with Bailey's Irish Cream. This ones the lover that'll love
                                  you back.",
                    price:       9.35,
                    image:        open("public/uploads/item/image/.jpg")
                    status:      1)

item3 = Item.create(title:       "Milky chocolate lova'",
                    description: "Turn down the lights and turn up the love, this favorite blends a classic
                                    milk chocolate cream with a smooth blend of Presidente' brandy.",
                    price:       10.75,
                    status:      1)

item4 = Item.create(title:       "Margerita Lima lickin'",
                    description: "Lemon Lima serbert meets Grand Marnier and Don Julio tequilla. If 
                                    this don't get your party started, nothing will!",
                    price:       10.75,
                    status:      1)

item5 = Item.create(title:       "Strawberry passionate",
                    description: "Sweet sensual strawberries with a classic creamy feel wrapped up in
                                    notes of Captains dark Rum. Summer, winter, whenever.",
                    price:       9.35,
                    status:      1)

item6 = Item.create(title:       "Malbec makeout",
                    description: "Real Alamos Malbec made with alamos grapes grown in the foothills of the 
                                    Andes, swirled together with a classic sweet cream. Romance comes to
                                    life with every single spoonful.",
                    price:       8.29,
                    status:      1)

item7 = Item.create(title:       "Minty mythos",
                    description: "A childhood favorite kicked up for the adult desire. Chocolate chip 
                                cream blended with the unique flavor of Ska brewing Minthe Stout.",
                    price:       8.29,
                    status:      1)

item8 = Item.create(title:       "Cherry cheery cheeks",
                    description: "Rich dark cherry cream with Ghirardelli chocolate chunks blended with
                                    the spice of Captain Morgans. Oh yeah baby, you got a lil in you?",
                    price:       9.35,
                    status:      1)

item9 = Item.create(title:       "Blackberry night",
                    description: "Classic blackberry cream, with full fruity blackberrys and deep
                                    delicius burbon from Breckenridge CO. Your motor will run all night
                                    long.",
                    price:       10.75,
                    status:      1)

item10 = Item.create(title:      "Peachy pucker up",
                    description: "Palisade peaches in peach sherbert with peach liquer. Here comes the 
                                    smiles...ladies?",
                    price:       8.29,
                    status:      1)

item11 = Item.create(title:      "Lemon Purrrrang...",
                    description: "A little tart, a little sweet, a little Jose silver tequilla decadent 
                                    bites of our house made purrrrang.",
                    price:       9.35,
                    status:      1)

item12 = Item.create(title:      "Tropical fling",
                    description: "Our homemade tropical sherbert blends the flavors of pineapple and orange
                                    from real fruit juices, adds a swirl of coconut cream and tops it off with
                                    Don Juilio tequilla, Kettle one Vodka, and Pussers Rum for a refreshing tropical
                                    expereince that will leave your toes curled.",
                    price:       10.75,
                    status:      1)

item13 = Item.create(title:      "Awesome sauce",
                    description: "Oh you gotta try this on, we start with our house made sweet cream, 
                                    then we kick it up a notch with a dash of Sirracha. Blend in the fresh
                                    flavors of orange and lima'. Crank it up even further with Don Julio tequila,
                                    and mix in real bacon bits. If our awesome sause doesn't get you hot you best
                                    see a doctor!",
                    price:       11.49,
                    status:      1)

item14 = Item.create(title:      "Butter my baby",
                    description: "Butter Caramel cream, crispy bites of butter toffee, and Breckenridge
                                    Burbon. It's a recipe for love.",
                    price:       9.35,
                    status:      1)

item15 = Item.create(title:      "Lil' Ginger tart",
                    description: "She's sassy and sultry all at once. Gingersnap cream, mixed in candied
                                    ginger bits, swirl in fresh mint cream, then simmer it down with a 
                                    dose of Buffalo Trace burbon. She'll slap you happy.",
                    price:       9.35,
                    status:      1)

item16 = Item.create(title:      "Take me home tonight",
                    description: "Our homemade cucumber lemon sherbert swirled with real Colorado honey, 
                                    infused with Buffalo Trace burbon. The perfect nightcap.",
                    price:       9.35,
                    status:      1)

item17 = Item.create(title:      "Aztec lover",
                    description: "A romance novel in ever bite. We start with house spicey chai cream,
                                    add Ghirardelli dark chocolate chips, then blend in Godiva dark chocolate
                                    liqueur and a splash of Don Julio tequila. Tall dark and misterious anyone?",
                    price:       9.35,
                    status:      1)

item18 = Item.create(title:      "Minty freshness",
                    description: "White mint sweet cream, mix in crispy candy cane crush, blended with Zwack 
                                    liqueur and Rumple Minze schnapps. You'll be kissably fresh or your money back!",
                    price:       9.35,
                    status:      1)

item19 = Item.create(title:      "The temtress",
                    description: "We start with a sensual sweet cream base, and blend in our home made
                                    cinnimon apple pie filling. Next we add chunks of candied ginger, then
                                    mix in Zwack liqueur and a touch of bitters. This mysterious lady will
                                    leave you with a flavor to remember her by.",
                    price:       10.75,
                    status:      1)

item20 = Item.create(title:      "Irish lass",
                    description: "We use our classic french vanilla cream, mix it up with fresh raspberries and
                                    diced mint leaves, then blend it with Maui Brewing CoCoNut porter.",
                    price:       8.25,
                    status:      1)

item21 = Item.create(title:      "White wine sherbert",
                    description: "It's straight up, and sometimes just what you need. Our custom made
                                    white wine sherbet packs a bubbly suprise that will tantilize your
                                    tounge with each delicate spoonful.",
                    price:       8.25,
                    status:      1)

item22 = Item.create(title:      "Tortuga nights",
                    description: "We start with a blend of our white wine sherbert, and swirl it with our
                                    pineapple lima sherbert, add fresh pitted cherries, then blend in Captain
                                    Morgan Black spiced rum.",
                    price:       9.35,
                    status:      1)

item23 = Item.create(title:      "Muff'n crush",
                    description: "We take our house orange sherbert, add a splash of bitters, fresh 
                                    candied orange bits, and blend it with Captains original. Guess who's
                                    gotta new crush?",
                    price:       9.35,
                    status:      1)

category1 = Category.create(title:       "Tequila take me home...",
                            description: "Senor or senorita, these one of a kind ice'screams infuse the flavors of 
                            Jose Cuervo' and Don Julio tequilas.")

category2 = Category.create(title:       "Whiskey lovers...",
                            description: "Sentuous and sultry, our wiskey blended screams use the rich flavors of
                                            Buffalo Trace and Breckenridge burbons.")

category3 = Category.create(title:       "liqueur me up...",
                            description: "Looking for something refreshing and different, these screams offer surprises 
                                            you never saw coming, blinding unique liqueurs with unique house made screams 
                                            and sherberts.")

category4 = Category.create(title:       "Classic and kissable...",
                            description: "Classic adult favorites, we take the goto flavors of porters, stouts, and wine
                                            blended with house screams and sherberts to bring you one of a kind sensations.")

category5 = Category.create(title:       "Rummance happens...",
                            description: "Rummace happens when you take our custom made screamery flavors and mix in Captain's
                                            spiced rum. Tropical or sensual, don't worry, we wont tell.")

category1.items << item1
category1.items << item4
category1.items << item11
category1.items << item12
category1.items << item13
category2.items << item3
category2.items << item9
category2.items << item14
category2.items << item15
category2.items << item16
category3.items << item6
category3.items << item7
category3.items << item10
category3.items << item20
category3.items << item21
category4.items << item2
category4.items << item18
category4.items << item19
category5.items << item5
category5.items << item8
category5.items << item22
category5.items << item23


# Create the users
#
# user1 = User.create(first_name:      "Jeff",
#                     last_name:       "Casimir",
#                     email:           "jeff@jumpstartlab.com"
#                     username:        "jeff",
#                     password_digest: "",
#                     salt:            "",
#                     address_id:      "",
#                     role:            "")
#

# user1 = User.create(first_name:      "Jorge",
#                     last_name:       "Tellez",
#                     email:           "jorge@jumpstartlab.com"
#                     username:        "jorge",
#                     password_digest: "",
#                     salt:            "",
#                     address_id:      "",
#                     role:            "")
#
admin_josh = User.create(first_name:     "Josh",
                  last_name:             "Cheek",
                  email:                 "josh@jumpstartlab.com",
                  username:              "josh",
                  password:              "password",
                  password_confirmation: "password",
                  role:                   "admin")

admin_rachel = User.create(first_name:     "Rachel",
                  last_name:             "Warbelow",
                  email:                 "rachel@jumpstartlab.com",
                  password:              "password",
                  password_confirmation: "password",
                  role:                   "default",
                  street:                 "1510 Blake St",
                  city:                   "Denver",
                  state:                  "CO",
                  zipcode:                "80202",
                  role:                   "default")

order1 = User.find(2).orders.create(status: "paid", receiving: "Delivery")
order2 = User.find(2).orders.create(status: "paid", receiving: "Delivery")
order3 = User.find(2).orders.create(status: "ordered", receiving: "Delivery")
order4 = User.find(2).orders.create(status: "completed", receiving: "Delivery")
order5 = User.find(2).orders.create(status: "completed", receiving: "Delivery")
order6 = User.find(2).orders.create(status: "cancelled", receiving: "Delivery")
order7 = User.find(2).orders.create(status: "cancelled", receiving: "Delivery")
order7 = User.find(2).orders.create(status: "ordered", receiving: "Delivery")


order1.cart_items.create(item_id: 1)
order1.cart_items.create(item_id: 1)
order1.cart_items.create(item_id: 2)
order1.cart_items.create(item_id: 4)
order2.cart_items.create(item_id: 4)
order2.cart_items.create(item_id: 7)

puts "============= Seeding Data End ============="
