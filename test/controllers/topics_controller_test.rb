require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @subject = subjects(:one)
    @topic = topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new, subject_id: @subject.id
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, {subject_id: @subject.id, topic: { topic_name: @topic.topic_name }}
    end

    assert_redirected_to subject_path(@subject)
  end

  test "should show topic" do
    get :show, { subject_id: @subject.id, id: @topic }
    assert_response :success
  end

  test "should get edit" do
#    get :edit, id: @topic
    get :edit, subject_id: @subject.id, id: @topic
    assert_response :success
  end

  test "should update topic" do
    patch :update, id: @topic, topic: { topic_name: @topic.topic_name, uuid: SecureRandom.uuid  }
    assert_redirected_to topic_path(assigns(:topic))
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, id: @topic
    end

    assert_redirected_to topics_path
  end
end
