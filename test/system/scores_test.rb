require "application_system_test_case"

class ScoresTest < ApplicationSystemTestCase
  setup do
    @score = scores(:one)
  end

  test "visiting the index" do
    visit scores_url
    assert_selector "h1", text: "Scores"
  end

  test "creating a Score" do
    visit scores_url
    click_on "New Score"

    fill_in "Frame 1", with: @score.frame_1
    fill_in "Frame 10", with: @score.frame_10
    fill_in "Frame 2", with: @score.frame_2
    fill_in "Frame 3", with: @score.frame_3
    fill_in "Frame 4", with: @score.frame_4
    fill_in "Frame 5", with: @score.frame_5
    fill_in "Frame 6", with: @score.frame_6
    fill_in "Frame 7", with: @score.frame_7
    fill_in "Frame 8", with: @score.frame_8
    fill_in "Frame 9", with: @score.frame_9
    fill_in "Total", with: @score.total
    click_on "Create Score"

    assert_text "Score was successfully created"
    click_on "Back"
  end

  test "updating a Score" do
    visit scores_url
    click_on "Edit", match: :first

    fill_in "Frame 1", with: @score.frame_1
    fill_in "Frame 10", with: @score.frame_10
    fill_in "Frame 2", with: @score.frame_2
    fill_in "Frame 3", with: @score.frame_3
    fill_in "Frame 4", with: @score.frame_4
    fill_in "Frame 5", with: @score.frame_5
    fill_in "Frame 6", with: @score.frame_6
    fill_in "Frame 7", with: @score.frame_7
    fill_in "Frame 8", with: @score.frame_8
    fill_in "Frame 9", with: @score.frame_9
    fill_in "Total", with: @score.total
    click_on "Update Score"

    assert_text "Score was successfully updated"
    click_on "Back"
  end

  test "destroying a Score" do
    visit scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Score was successfully destroyed"
  end
end
