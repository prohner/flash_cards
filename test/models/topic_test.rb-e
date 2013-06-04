require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "should not save without topic name" do
    topic = Topic.new
    topic.uuid = "123"
    assert ! topic.save
  end

  test "should create a default UUID" do
    topic = Topic.new
    assert topic.uuid != nil
  end

  test "should create a default download code" do
    topic = Topic.new
    assert topic.download_code != nil
  end

  test "should save with topic name & UUID" do
    topic = Topic.new                   
    topic.topic_name = "abc"
    topic.uuid = "123"
    assert topic.save
  end
  
  test "should not allow duplicate UUIDs" do
    topic = Topic.new                   
    topic.topic_name = "abc"
    topic.uuid = "123"
    topic.save
    
    topic = Topic.new                   
    topic.topic_name = "abc"
    topic.uuid = "123"
    assert ! topic.save
  end
  
  test "should not allow duplicate download codes" do
    topic = Topic.new                   
    topic.topic_name = "abc"
    topic.download_code = "123"
    topic.save
    
    topic = Topic.new                   
    topic.topic_name = "abc"
    topic.download_code = "123"
    assert ! topic.save
  end
end
