CustomerRecords
==============

This repository contains a sample app for loading Customer's Records.


---
# Existing Functionalities

The app is currently able to load Customers from file, and show it in list form.

* When the app loads, it will load the Customers from file, and show them in the tableView.
* The customers will be filtered, by the distance from target office location.
* The distance will be calculated based on customer's and target office's Latitude and Longitude.

---
# Development Steps

1. Create new project based on single view app
2. Create folders for MVVM pattern
3. Add CustomersViewController and Design the UI layout to show Customers List
4. Add Customers's DataLoader
5. Add DistanceCalculator
6. Add Models and ViewModels, that will show the Customer List at CustomersViewController
7. Add Filter feature to CustomersViewModel
8. Add Unit Tests to test the process


