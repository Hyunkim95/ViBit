require 'test_helper'

class DriveDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drive_datum = drive_data(:one)
  end

  test "should get index" do
    get drive_data_url
    assert_response :success
  end

  test "should get new" do
    get new_drive_datum_url
    assert_response :success
  end

  test "should create drive_datum" do
    assert_difference('DriveDatum.count') do
      post drive_data_url, params: { drive_datum: { end_loc: @drive_datum.end_loc, end_time: @drive_datum.end_time, start_loc: @drive_datum.start_loc, start_time: @drive_datum.start_time, stats: @drive_datum.stats, user_id: @drive_datum.user_id } }
    end

    assert_redirected_to drive_datum_url(DriveDatum.last)
  end

  test "should show drive_datum" do
    get drive_datum_url(@drive_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_drive_datum_url(@drive_datum)
    assert_response :success
  end

  test "should update drive_datum" do
    patch drive_datum_url(@drive_datum), params: { drive_datum: { end_loc: @drive_datum.end_loc, end_time: @drive_datum.end_time, start_loc: @drive_datum.start_loc, start_time: @drive_datum.start_time, stats: @drive_datum.stats, user_id: @drive_datum.user_id } }
    assert_redirected_to drive_datum_url(@drive_datum)
  end

  test "should destroy drive_datum" do
    assert_difference('DriveDatum.count', -1) do
      delete drive_datum_url(@drive_datum)
    end

    assert_redirected_to drive_data_url
  end
end
