class EmploymentInfo
  include Capybara::DSL
  include RSpec::Matchers

  SCREEN_TITLE = '.title'
  OTHER_GROSS_INCOME_FIELD = 'gross-monthly-other-income'
  EMPLOYMENT_STATUS_DROPDOWN = '#agselectemployment-status'
  DROPDOWN_OPTIONS = '[role="menuitem"]'
  MONTHLY_INCOME_DROPDOWN = '#agselectother-income'

  def validate_title(name)
    expect(page).to have_css(SCREEN_TITLE, text: name)
  end

  def select_employment_status(name)
    find(EMPLOYMENT_STATUS_DROPDOWN).click
    find(DROPDOWN_OPTIONS, text: name).click
    expect(page).to have_no_css(DROPDOWN_OPTIONS)
  end

  def select_monthly_income(name)
    find(MONTHLY_INCOME_DROPDOWN).click
    find(DROPDOWN_OPTIONS, text: name).click
    expect(page).to have_no_css(DROPDOWN_OPTIONS)
  end

  def enter_other_gross_income(name)
    fill_in OTHER_GROSS_INCOME_FIELD, with: name
  end

  def validate_active_button
    expect(page).to have_button('Next', disabled: false)
  end

  def click_next
    click_button('Next')
  end

end
