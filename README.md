# Flight booker

Implementation of a form that supports inputs for multiple models.

Check the Heroku live deplyoyment [here](#). (TODO)

Technical requirements:

- General
  - Site's root should point to flights#index

- Search Form
  - Should send a GET request to flights#index.
  - Should have select dropdown inputs for:
    - departure  airport code.
    - arrival airport code.
    - flight time.
    - number of tickets.

- flights#index
  - The Flight search should only be done with the Flight Time input

- Flight Selection Form
  - Should be rendered below the Search Form.
  - Should only be rendered after a Search Form submission.
  - Should have a radio button input to select amoung the returned flights.
  - Should have a hidden input to pass the number of tickets selection to the next form.

- Register Form
  - A single form that will create both the Passengers and Booking entries.
  - The main form should create the Booking object
  - A nested form should provide fields to create as many Passengers as the selected number of tickets.

Further improvements ideas:
  - Add dynamic content to the search input fields.
  - Implement a better search algorithm to find flights.
  - Better flights and passengers partials
  - Improve bookings#new view (nested passenger form)

---

This repo is an implementation of the [Flight](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker) project.

This is part of [The Odin Project](https://www.theodinproject.com/).
