# Tangela
Tangela is a project colloboration tool that offers a simple visual
interface for organizing projects and resources.

Tangela Projects are designed to organize ideas, resources, and tasks
into a simple display. The goal of Tangela is to minimize the amount of
time you spend organizing ideas and maximizing the amount of time you
have to create.

## Testing
Tangela uses RSpec, Capybara, Shoulda, and Factory Girls in its
tests. By default javascript testing is done using Selenium and the
ChromeDriver. If you want to use Firefox as your browser, then remove
the following code from spec_helper.rb.

``` ruby
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
```

## Author

* David Ratajczak
* [mockra.com](http://mockra.com/)
