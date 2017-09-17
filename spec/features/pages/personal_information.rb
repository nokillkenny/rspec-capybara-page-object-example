class PersonalInformation
  include Capybara::DSL
  include RSpec::Matchers

  SCREEN_TITLE = '.title'
  FIRST_NAME_FIELD = 'firstNameTextField'
  LAST_NAME_FIELD = 'lastNameTextField'
  DOB_FIELD = 'dobTextField'
  MOBILE_PHONE_FIELD = 'mobilePhoneTextField'
  EMAIL_FIELD = 'emailTextField'
  PASSWORD_FIELD = 'passwordTextField'
  CONFIRM_PASSWORD_FIELD = 'confirmPasswordTextField'


  def validate_title(name)
    expect(page).to have_css(SCREEN_TITLE, text: name)
  end


  def fill_in_valid_credentials
    fill_in FIRST_NAME_FIELD, with: "firstName"
    fill_in LAST_NAME_FIELD, with: "lastName"
    fill_in DOB_FIELD, with: "01/01/1999"
    fill_in MOBILE_PHONE_FIELD, with: "1233211234"
    fill_in EMAIL_FIELD, with: "autotest+#{Time.now.to_i}@mailinator.com"
    fill_in PASSWORD_FIELD, with: "Autogravity1"
    fill_in CONFIRM_PASSWORD_FIELD, with: "Autogravity1"
  end

  def validate_active_button
    expect(page).to have_button('Create and Continue', disabled: false)
  end

  def click_continue
    click_button('Create and Continue')
  end
end
