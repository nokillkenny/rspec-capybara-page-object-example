class SelectMake
  include Capybara::DSL
  include RSpec::Matchers

  def validate_page
    expect(page).to have_text('TESLA')
  end

  def click_make(brand)
    find("[title='#{brand}']").click
  end

end
