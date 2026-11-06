require "test_helper"

class GitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @git = gits(:one)
  end

  test "should get index" do
    get gits_url
    assert_response :success
  end

  test "should get new" do
    get new_git_url
    assert_response :success
  end

  test "should create git" do
    assert_difference("Git.count") do
      post gits_url, params: { git: { status: @git.status } }
    end

    assert_redirected_to git_url(Git.last)
  end

  test "should show git" do
    get git_url(@git)
    assert_response :success
  end

  test "should get edit" do
    get edit_git_url(@git)
    assert_response :success
  end

  test "should update git" do
    patch git_url(@git), params: { git: { status: @git.status } }
    assert_redirected_to git_url(@git)
  end

  test "should destroy git" do
    assert_difference("Git.count", -1) do
      delete git_url(@git)
    end

    assert_redirected_to gits_url
  end
end
