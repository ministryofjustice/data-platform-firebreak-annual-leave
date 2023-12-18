// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import '@hotwired/turbo-rails'
// import 'controllers'
import 'govuk-frontend'

// import { initAll } from '../../app/javascript/govuk-frontend.min.js';
import { initAll } from '../../node_modules/govuk-frontend/dist/govuk/govuk-frontend.min.js'
initAll()

// This is right ^ I'm sure, you get errors in the console if you include it in the application.html.erb
