require 'test_helper'

class DownloadsControllerTest < ActionController::TestCase
  setup do
    @subject = subjects(:one)
    @topic = topics(:one)
  end

  test "should get all subject data" do
    get :subject, :download_code => @subject.download_code, :format => :json
    assert_response :success

    body = ActiveSupport::JSON.decode(@response.body).symbolize_keys
    assert body[:download_code] == @subject.download_code
    assert body[:subject_name] == @subject.subject_name
  end

  test "should get all topic data" do
    get :topic, :download_code => @topic.download_code, :format => :json
    assert_response :success

    body = ActiveSupport::JSON.decode(@response.body).symbolize_keys
    assert body[:download_code] == @topic.download_code
    assert body[:topic_name] == @topic.topic_name
  end
end
