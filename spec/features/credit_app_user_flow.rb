require 'spec_helper'

feature 'Credit Application User Flow up to SSN', %q{
  As a visitor
  I want to fill out an application
  So that I can view the Social Security number page
} do

  background do
    visit 'https://apply.autogravity.com/'
  end

  scenario 'apply for a no trade credit application' do
    home_page = Home.new
    select_make_page = SelectMake.new
    select_model_page = SelectModel.new
    select_trim_page = SelectTrim.new
    review_details_page = ReviewDetails.new
    select_dealership_page = SelectDealership.new
    personal_information_page = PersonalInformation.new
    residence_page = Residence.new
    employment_info_page = EmploymentInfo.new
    identification_info_page = Identification.new

    #home page
    home_page.click_next

    #brand make page
    select_make_page.validate_page
    select_make_page.click_make("Tesla")

    #model page
    select_model_page.validate_title('Select a Tesla Model')
    select_model_page.click_model('Model X')

    #trim page
    select_trim_page.validate_title('Select a Model X Trim')
    select_trim_page.click_year
    select_trim_page.validate_selected_year_and_trim('2017 Tesla Model X')
    select_trim_page.select_car('90D AWD')

    #review details page
    review_details_page.validate_title('Review Details')
    review_details_page.validate_car_details('2017 Tesla Model X 90D AWD $93,500 MSRP')
    review_details_page.click_confirm_details

    #validate dealership page
    select_dealership_page.validate_title('Select a Tesla Dealership')
    select_dealership_page.stall_for_asset_load(1)
    select_dealership_page.fill_in_zip('92626')
    select_dealership_page.validate_expected_dealer('Tesla Costa Mesa')
    select_dealership_page.select_dealer('Tesla Costa Mesa')

    #validate Personal Info Page
    personal_information_page.validate_title('Personal Information')
    personal_information_page.fill_in_valid_credentials
    personal_information_page.validate_active_button
    personal_information_page.click_continue

    # validate Residence page
    residence_page.validate_title('Residence Information')
    residence_page.fill_in_address_fields
    residence_page.select_residence_type('Own')
    residence_page.select_state('California')
    residence_page.validate_active_button
    residence_page.click_next

    # validate employment info
    employment_info_page.validate_title('Employment Information')
    employment_info_page.select_employment_status('Retired')
    employment_info_page.select_monthly_income('Spouse')
    employment_info_page.enter_other_gross_income('1000000')
    employment_info_page.validate_active_button
    employment_info_page.click_next

    # validate identification info
    identification_info_page.validate_title('Identification')
  end
end
