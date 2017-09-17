An example for capybara with page objects
============================================================

I made this while running on OSX. You will need

    * Ruby 2.4+
    
Firefox is installed as default. You will need Chrome or Safari driver installed to run tests on those browsers     

With homebrew :  `brew install chromedriver`

After download, please run this command to get dependencies  

    bundle install 
To run the scenario:

     bundle exec rspec spec/features/credit_app_user_flow.rb
