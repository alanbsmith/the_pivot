Still to do:

--> Base Expectations <--

Unauthenticated Users CAN
=====================================
 browse by category
 increase quantity from cart

Unauthenticated Users CAN'T
=====================================
  views others data

Authenticated users CAN
=====================================
(link) view their past orders with links to display each order

on that order display page there are:
line-item subtotals

if any item is retired from the menu:
=====================================
they can still access the item page
they cannot add it to a new cart

Authenticated users CAN'T
=====================================
view another user’s private data (such as current order, etc.)

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Admin CAN
====================================

Assign items to categories or remove them from categories.
Products can belong to more than one category.

See a listing of all orders with: (Corey)
========================================
the total number of orders by status
links for each individual order
filter orders to display by status type (for statuses "ordered", "paid", "cancelled", "completed")
  --> If can/comp then no delete button

link to transition to a different status: (Hilary)
=========================================================================
link to "cancel" individual orders which are currently "ordered" or "paid"
link to "mark as paid" orders which are "ordered"
link to "mark as completed" individual orders which are currently "paid"
  --> make the link work

Access details of an individual order, including: (Hilary)
=================================================
Order date and time
Purchaser full name and email address
For each item on the order:
Name linked to the item page
Quantity
Price
Line item subtotal
Total for the order
Status of the order

Update an individual order (Tan)
===========================================================
View and edit orders;
  may change quantity or remove items from orders with the status of pending or paid

Order(Horacio)
====================================================
An order is marked for pickup or delivery  
If marked for delivery, an order is attached to user address  
finish orders controller for admin  

Item (Tan)
=================================================
The photo is optional. If not present, a stand-in photo is used.

Update seed
===================================================
Orders & Item images

Tests coverage
==================================================
everywhere

Refactoring for beauty
===================================================

Make that shit perdy
===================================================


Extensions
===================================================
