require 'test_helper'

class ScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score = scores(:one)
    @score_1 = scores(:two)
    @score_2 = scores(:three)
  end

  test "should get index" do
    get scores_url
    assert_response :success
  end

  test "should get new" do
    get new_score_url
    assert_response :success
  end

  test "should create score_0" do
    assert_difference('Score.count') do
      post scores_url, params: { score: { frame_1: @score.frame_1, frame_10: @score.frame_10, frame_2: @score.frame_2, frame_3: @score.frame_3, frame_4: @score.frame_4, frame_5: @score.frame_5, frame_6: @score.frame_6, frame_7: @score.frame_7, frame_8: @score.frame_8, frame_9: @score.frame_9, total: @score.total } }
    end

    assert_redirected_to score_url(Score.last)
  end

  test "should create score_1" do
    assert_difference('Score.count') do
      post scores_url, params: { score: { frame_1: @score_1.frame_1, frame_10: @score_1.frame_10, frame_2: @score_1.frame_2, frame_3: @score_1.frame_3, frame_4: @score_1.frame_4, frame_5: @score_1.frame_5, frame_6: @score_1.frame_6, frame_7: @score_1.frame_7, frame_8: @score_1.frame_8, frame_9: @score_1.frame_9, total: @score_1.total } }
    end

    assert_redirected_to score_url(Score.last)
  end

  test "should create score_2" do
    assert_difference('Score.count') do
      post scores_url, params: { score: { frame_1: @score_2.frame_1, frame_10: @score_2.frame_10, frame_2: @score_2.frame_2, frame_3: @score_2.frame_3, frame_4: @score_2.frame_4, frame_5: @score_2.frame_5, frame_6: @score_2.frame_6, frame_7: @score_2.frame_7, frame_8: @score_2.frame_8, frame_9: @score_2.frame_9, total: @score_2.total } }
    end

    assert_redirected_to score_url(Score.last)
  end

  test "should show score" do
    get score_url(@score)
    assert_response :success
  end

  test "should get edit" do
    get edit_score_url(@score)
    assert_response :success
  end

  test "should update score" do
    patch score_url(@score), params: { score: { frame_1: @score.frame_1, frame_10: @score.frame_10, frame_2: @score.frame_2, frame_3: @score.frame_3, frame_4: @score.frame_4, frame_5: @score.frame_5, frame_6: @score.frame_6, frame_7: @score.frame_7, frame_8: @score.frame_8, frame_9: @score.frame_9, total: @score.total } }
    assert_redirected_to score_url(@score)
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete score_url(@score)
    end

    assert_redirected_to scores_url
  end
end
