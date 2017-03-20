# README
(simple installation example)

## Generate new Rails app with PostgresQL
```
rails new seatruck -d postgresql -T -B
cd seatruck
rvm --ruby-version use 2.3.1@seatruck --create
```
### Gemfile
```
gem 'slim-rails'
gem 'responders'
gem 'active_model_serializers'
gem 'oj'
gem 'oj_mimic_json'

```
### /config/database.yml
```
cd config
cp database.yml database_sample.yml
```
### .gitignore
```
/config/database.yml
```

# RSpec

## Gemfile  
```
group :test, :development do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-byebug'

  # for API testing
  gem 'json_spec'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
  gem 'database_cleaner'
end
```
### for 5xx Rails
```
group :test, :development do
  gem 'rails-controller-testing'
end
```

### Bundler
```
gem install bundler --no-ri --no-rdoc
bundler
```

## RSpec generate
rails generate rspec:install

## .rspec
```
--color
--require spec_helper
--format doc
```

## rails_helper.rb
### after require ...
```
require 'shoulda/matchers'
```
### uncomment Dir...
```
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```
### RSpec.configure for 4xx Rails
```
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  #config.include Devise::TestHelpers, type: :controller
  #config.extend ControllerMacros, type: :controller
  #config.include ControllerMacros, type: :controller
  #config.include OmniauthMacros
  ...
```
### RSpec.configure for 5xx Rails
```
RSpec.configure do |config|
  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
  end
  config.include FactoryGirl::Syntax::Methods
  config.include AcceptanceMacros, type: :feature
  #config.include OmniauthMacros, type: :feature
  #config.include Devise::Test::ControllerHelpers, type: :controller
```
### insert at the end
```
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

### Comfig RSpec generators - config/application.rb
```
config.generators do |g|
  g.test_framework :rspec,
                   fixtures: true,
                   view_specs: false,
                   helper_specs: false,
                   routing_specs: false,
                   request_specs: false,
                   controller_specs: true

  g.fixture_replacement :factory_girl, dir: 'spec/factories'
end
```

### spec/acceptance/acceptance_helper.rb
```
require 'rails_helper'
require 'capybara/poltergeist'
# require 'capybara/rspec'

RSpec.configure do |config|
  # Capybara.javascript_driver = :webkit
  Capybara.javascript_driver = :poltergeist
  # Capybara.javascript_driver = :selenium

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
  end
  #config.include AcceptanceMacros, type: :feature  
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each, sphinx: true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.use_transactional_fixtures = false
end
```

### Git
```
git init
git add .
git ci -m init project
git remote add origin git@github.com:khovanov/seatruck.git
git push -u origin master
```
## Generate controller Welcome
```
rails g controller welcome index
```
### Edit root routes
```
root 'welcome#index'
```
## Generate Port
```
rails g scaffold Port title:string 'lat:decimal{13,10}' 'lng:decimal{13,10}'
```
## Setup DB from seeds (before prepare seeds.rb)
```
rake db:setup
```
## Generate Cargo
```
rails g scaffold Cargo title:string port:references open_date:date capacity:integer
```
## Generate Vessel
```
rails g scaffold Vessel title:string hold_capacity:integer
```

## Generate Position
```
rails g scaffold Position vessel:references port:references open_date:date
```

## Generate Cargo serializer
```
rails g serializer cargo
rails g serializer port
rails g serializer position
rails g serializer vessel
```

# for Heroku
ruby '2.3.1'
