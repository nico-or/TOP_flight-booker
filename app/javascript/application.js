// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"

// Departure Menu
departure_continent_dropdown = document.querySelector('#departure_continent')
departure_country_dropdown = document.querySelector('#departure_country')
departure_airport_dropdown = document.querySelector('#departure_airport')

departure_country_dropdown.disabled = true
departure_airport_dropdown.disabled = true

original_departure_countries = departure_country_dropdown.innerHTML
original_departure_airports = departure_airport_dropdown.innerHTML

departure_continent_dropdown.addEventListener('change', event => {
  departure_country_dropdown.disabled = false
  departure_country_dropdown.innerHTML = original_departure_countries

  continent = event.target.value
  countries = departure_country_dropdown.querySelector(`optgroup[label='${continent}']`)
  departure_country_dropdown.innerHTML = countries.innerHTML
})

original_departure_airports = departure_airport_dropdown.innerHTML

departure_country_dropdown.addEventListener('change', event => {
  departure_airport_dropdown.disabled = false
  departure_airport_dropdown.innerHTML = original_departure_airports

  country = event.target.value
  airports = departure_airport_dropdown.querySelector(`optgroup[label='${country}']`)
  departure_airport_dropdown.innerHTML = airports.innerHTML
})

// Arrival Menu
continent_arrival_dropdown = document.querySelector('#arrival_continent')
country_arrival_dropdown = document.querySelector('#arrival_country')
airport_arrival_dropdown = document.querySelector('#arrival_airport')

country_arrival_dropdown.disabled = true
airport_arrival_dropdown.disabled = true

original_arrrival_countries = country_arrival_dropdown.innerHTML
original_arrival_airports = airport_arrival_dropdown.innerHTML

continent_arrival_dropdown.addEventListener('change', event => {
  country_arrival_dropdown.disabled = false
  country_arrival_dropdown.innerHTML = original_arrrival_countries

  continent = event.target.value
  countries = country_arrival_dropdown.querySelector(`optgroup[label='${continent}']`)
  country_arrival_dropdown.innerHTML = countries.innerHTML
})

original_arrival_airports = airport_arrival_dropdown.innerHTML

country_arrival_dropdown.addEventListener('change', event => {
  airport_arrival_dropdown.disabled = false
  airport_arrival_dropdown.innerHTML = original_arrival_airports

  country = event.target.value
  airports = airport_arrival_dropdown.querySelector(`optgroup[label='${country}']`)
  airport_arrival_dropdown.innerHTML = airports.innerHTML
})
