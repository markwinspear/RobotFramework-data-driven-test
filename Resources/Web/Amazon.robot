*** Settings ***
Resource  ../Web/PO/LandingPage.robot
Resource  ../Web/PO/TopNav.robot
Resource  ../Web/PO/SearchResults.robot
Resource  ../Web/PO/Product.robot
Resource  ../Web/PO/Cart.robot
Resource  ../Web/PO/SignIn.robot

*** Keywords ***
Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search for Products
    SearchResults.Verify Search Completed

Select Product from Search Results
    SearchResults.Click Product link
    Product.Verify Page Loaded

Add Product to Cart
    Product.Add to Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed to Checkout
    SignIn.Verify Page Loaded