class Identification
  include Capybara::DSL
  include RSpec::Matchers

  SCREEN_TITLE = '.title'
  RESIDENCE_STATUS_DROPDOWN = '#agselecthouseinfo'
  DROPDOWN_OPTIONS = '[role="menuitem"]'
  ADDRESS_HELPER = '.pac-item'
  ADDRESS_FIELD = 'aginputaddress'
  CITY_FIELD = 'aginputcity'
  STATE_DROPDOWN = '#agselectstate'
  MOVE_IN_DATE_FIELD = 'aginputmoveindate'
  MORTGAGE_PAYMENT_FIELD = 'aginputpayment'
  POSTAL_CODE_FIELD = 'aginputzip'

  def validate_title(name)
    expect(page).to have_css(SCREEN_TITLE, text: name)
  end

  def select_residence_type(name)
    find(RESIDENCE_STATUS_DROPDOWN).click
    find(DROPDOWN_OPTIONS, text: name).click
    expect(page).to have_no_css(DROPDOWN_OPTIONS)
  end

end