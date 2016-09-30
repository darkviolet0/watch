require 'test_helper'

class CycleTrackCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cycle_track_comment = cycle_track_comments(:one)
  end

  test "should get index" do
    get cycle_track_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_cycle_track_comment_url
    assert_response :success
  end

  test "should create cycle_track_comment" do
    assert_difference('CycleTrackComment.count') do
      post cycle_track_comments_url, params: { cycle_track_comment: { CycleTrack_id: @cycle_track_comment.CycleTrack_id, User_id: @cycle_track_comment.User_id, rating: @cycle_track_comment.rating, text: @cycle_track_comment.text } }
    end

    assert_redirected_to cycle_track_comment_url(CycleTrackComment.last)
  end

  test "should show cycle_track_comment" do
    get cycle_track_comment_url(@cycle_track_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_cycle_track_comment_url(@cycle_track_comment)
    assert_response :success
  end

  test "should update cycle_track_comment" do
    patch cycle_track_comment_url(@cycle_track_comment), params: { cycle_track_comment: { CycleTrack_id: @cycle_track_comment.CycleTrack_id, User_id: @cycle_track_comment.User_id, rating: @cycle_track_comment.rating, text: @cycle_track_comment.text } }
    assert_redirected_to cycle_track_comment_url(@cycle_track_comment)
  end

  test "should destroy cycle_track_comment" do
    assert_difference('CycleTrackComment.count', -1) do
      delete cycle_track_comment_url(@cycle_track_comment)
    end

    assert_redirected_to cycle_track_comments_url
  end
end
