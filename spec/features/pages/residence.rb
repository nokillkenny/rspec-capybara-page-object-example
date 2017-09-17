class Residence
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

  def fill_in_address_fields
    fill_in ADDRESS_FIELD, with: '0123 Test Blvd. '
    fill_in CITY_FIELD, with: 'Irvine'
    fill_in POSTAL_CODE_FIELD, with: '92600'
    fill_in MOVE_IN_DATE_FIELD, with: '01/2000'
    fill_in MORTGAGE_PAYMENT_FIELD, with: '0'
  end

  def select_state(name)
    find(STATE_DROPDOWN).click
    find(DROPDOWN_OPTIONS, text: name).click
    expect(page).to have_no_css(DROPDOWN_OPTIONS)
  end

  def validate_active_button
    expect(page).to have_button('Next', disabled: false)
  end

  def click_next
    click_button('Next')
  end

end