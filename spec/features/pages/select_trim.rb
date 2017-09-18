class SelectTrim
  include Capybara::DSL
  include RSpec::Matchers

  CONTENT_TITLE = '.contentTitle___S_Ugq'
  DESKTOP_TAB = '.trimYearToggle___2qEko'
  TRIM_YEAR_TITLE = '.trim___EAwJ-'
  TRIM_LIST_ROW = '.trimListRow___3xZy7'

  def validate_title(name)
    expect(page).to have_css(CONTENT_TITLE, text: name)
  end

  def click_year(date)
    find('button', text: date).click
  end

  def validate_selected_year_and_trim(name)
    expect(page).to have_css(TRIM_YEAR_TITLE, text: name)
  end

  def select_car(name)
    find(TRIM_LIST_ROW, text: name).click
  end
end