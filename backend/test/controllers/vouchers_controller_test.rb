require "test_helper"

class VouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voucher = vouchers(:one)
  end

  test "should get index" do
    get vouchers_url, as: :json
    assert_response :success
  end

  test "should create voucher" do
    assert_difference("Voucher.count") do
      post vouchers_url, params: { voucher: { expired_date: @voucher.expired_date, giving_date: @voucher.giving_date, report_id: @voucher.report_id, sale: @voucher.sale, user_id: @voucher.user_id, using_date: @voucher.using_date, voucher_code: @voucher.voucher_code } }, as: :json
    end

    assert_response :created
  end

  test "should show voucher" do
    get voucher_url(@voucher), as: :json
    assert_response :success
  end

  test "should update voucher" do
    patch voucher_url(@voucher), params: { voucher: { expired_date: @voucher.expired_date, giving_date: @voucher.giving_date, report_id: @voucher.report_id, sale: @voucher.sale, user_id: @voucher.user_id, using_date: @voucher.using_date, voucher_code: @voucher.voucher_code } }, as: :json
    assert_response :success
  end

  test "should destroy voucher" do
    assert_difference("Voucher.count", -1) do
      delete voucher_url(@voucher), as: :json
    end

    assert_response :no_content
  end
end
