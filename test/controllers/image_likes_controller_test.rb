require 'test_helper'

class ImageLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_like = image_likes(:one)
  end

  test "should get index" do
    get image_likes_url
    assert_response :success
  end

  test "should get new" do
    get new_image_like_url
    assert_response :success
  end

  test "should create image_like" do
    assert_difference('ImageLike.count') do
      post image_likes_url, params: { image_like: { image_id: @image_like.image_id, user_id: @image_like.user_id } }
    end

    assert_redirected_to image_like_url(ImageLike.last)
  end

  test "should show image_like" do
    get image_like_url(@image_like)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_like_url(@image_like)
    assert_response :success
  end

  test "should update image_like" do
    patch image_like_url(@image_like), params: { image_like: { image_id: @image_like.image_id, user_id: @image_like.user_id } }
    assert_redirected_to image_like_url(@image_like)
  end

  test "should destroy image_like" do
    assert_difference('ImageLike.count', -1) do
      delete image_like_url(@image_like)
    end

    assert_redirected_to image_likes_url
  end
end
