// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import '@hotwired/turbo-rails'
// import 'controllers'

import { initAll } from 'govuk-frontend'
initAll()

// This is right ^ I'm sure, you get errors in the console if you include it in the application.html.erb
