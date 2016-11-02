require 'test_helper'

class BillOfLadingControllerTest < ActionDispatch::IntegrationTest
  test "should get address" do
    get bill_of_lading_address_url
    assert_response :success
  end

  test "should get contract" do
    get bill_of_lading_contract_url
    assert_response :success
  end

  test "should get phone_number" do
    get bill_of_lading_phone_number_url
    assert_response :success
  end

end
