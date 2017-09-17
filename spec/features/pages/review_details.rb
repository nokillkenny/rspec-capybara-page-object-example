class ReviewDetails
  include Capybara::DSL
  include RSpec::Matchers

  CONTENT_TITLE = '.contentTitle___S_Ugq'
  CAR_DETAILS = '.col-xs-12.col-sm-5'
  CONFIRM_DETAILS_BUTTON = '#confirmDetailsCTA'

  def validate_title(name)
    expect(page).to have_css(CONTENT_TITLE, text: name)
  end

  def validate_car_details(name)
    expect(page).to have_css(CAR_DETAILS, text: name)
  end

  def click_confirm_details
    find(CONFIRM_DETAILS_BUTTON).click
  end

end
