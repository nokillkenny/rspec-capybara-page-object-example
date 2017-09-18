class SelectDealership
  include Capybara::DSL
  include RSpec::Matchers

  CONTENT_TITLE = '.contentTitle___S_Ugq'
  ZIP_CODE_FIELD ='.input___27f7_'
  DEALER_LIST_BOX = '.dealerList___3mNfb'
  LIST_OF_DEALERS = '.dealerListItem___3_3p6'
  SELECT_DEALER_BUTTON = '#confirmDealerCTA'
  LOADING_LABEL = '.loadingLabel___3n3KT'

  TIMEOUT = 5

  def validate_title(name)
    expect(page).to have_css(CONTENT_TITLE, text: name)
  end

  def fill_in_zip(postal_code)
    find(ZIP_CODE_FIELD).click
    find(ZIP_CODE_FIELD).set("")
    find(ZIP_CODE_FIELD).send_keys(postal_code, :tab)
    find(CONTENT_TITLE).click
  end

  def validate_expected_dealer(name)
    expect(page).to have_css(DEALER_LIST_BOX, text: name)
  end

  def wait_for_load_text_to_disappear(name)
    using_wait_time TIMEOUT.to_i do
      page.has_no_css?(LOADING_LABEL, text: name)
    end
  end

  def select_dealer(name)
    find(LIST_OF_DEALERS, text: name).find(SELECT_DEALER_BUTTON).click
  end
end
