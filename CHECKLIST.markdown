TAN
===============================================================
<!-- - bug in the show for menu items (within show template)-->
<!-- - Admin dash board, with admin dropdown -->
- Whats Tan doing??? Finding waldo...
===============================================================

HILARY
===========================
- cart orders stuff(pending)
===========================


HORACIO
==============================================================================================
- retrofit testing for admin/order(pending)
- fix/link up categories selector (in both: new item & edit item) so categories attach to item
==============================================================================================


COREY
===========================================
<!-- - fix admin category tests -->
- implement user address / profile 
- add user ID link to admin/order dashboard
===========================================

This Weekend ==================================
- By Sunday, Base spec is met

===============================================



suggestions
  √ <!-- - 0. fix tests -->
  √ <!-- 1. get auth working -->
- 2. cart flow (esp unauth to auth)

  senario 1) I come to the site as an unauth user, add to cart, then signin, and want cart
  senario 2) I come to the site, sign in, then add to cart
  senario 3) I come to the site, add to cart, then leave
  senario 4) I come to the site, add to cart, sign up / sign in, and now want my cart

    ==> make an order
      - when you sign in pass the order_id to the auth user (via cookie)

- 3. continuous integration

What's your project timeline look like for the next week? Will you be cutting scope or adding extras?

√ <!-- unauthenticated cart -->
 become an authenticated cart (register, previously registered now login)
√ <!-- remove items -->

login
√ <!-- authorization -->
  can't view other user's data
  can't checkout
  can't view admin stuff

view by categories

authenticated cart
  locate user's cart
  add items
  remove items

authentication
  logout

authorization
  can't access admin stuff
  can't access other users

orders
  view past ones

admin dashboard
  various things