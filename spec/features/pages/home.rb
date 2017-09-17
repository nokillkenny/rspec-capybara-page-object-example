class Home
  include Capybara::DSL

  def click_next
    click_on     'NEXT'
  end

end
