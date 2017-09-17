class SelectModel
  include Capybara::DSL
  include RSpec::Matchers

  CONTENT_TITLE = '.contentTitle___S_Ugq'
  MODEL_BOXES= '.col-sm-3.model___3RrUN'

  def click_model(name)
    find(MODEL_BOXES, text: name).click
  end

  def validate_title(name)
    expect(page).to have_css(CONTENT_TITLE, text: name)
  end
end
