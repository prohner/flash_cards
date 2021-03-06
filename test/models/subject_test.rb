require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test "should not save without subject name" do
    subject = Subject.new
    subject.uuid = "123"
    assert ! subject.save
  end

  test "should create a default UUID" do
    subject = Subject.new
    assert subject.uuid != nil
  end

  test "should create a default download code" do
    subject = Subject.new
    assert subject.download_code != nil
  end

  test "should save with subject name & UUID" do
    subject = Subject.new                   
    subject.subject_name = "abc"
    assert subject.save
  end
  
  test "should not allow duplicate UUIDs" do
    subject = Subject.new                   
    subject.subject_name = "abc"
    subject.uuid = "123"
    subject.save
    
    subject = Subject.new                   
    subject.subject_name = "abc"
    subject.uuid = "123"
    assert ! subject.save
  end
  
  test "should not allow duplicate download codes" do
    subject = Subject.new                   
    subject.subject_name = "abc"
    subject.download_code = "123"
    subject.save
    
    subject = Subject.new                   
    subject.subject_name = "abc"
    subject.download_code = "123"
    assert ! subject.save
  end
  
  test "download code should not change" do
    s1 = subjects(:one)
    s2 = subjects(:one)
    
    assert s1.download_code == s2.download_code
  end

  test "topics should destroy their own topics and not leave orphans" do
    subject = Subject.new                   
    subject.subject_name = "abc"
    assert subject.save!

    topic = subject.topics.create()
    topic.topic_name = "whatever"
    assert topic.save!
    topic_id = topic.id
    assert_not_nil topic_id

    re_topic = Topic.find_by_id(topic_id)
    assert_not_nil re_topic

    subject.destroy!()
    re_topic = Topic.find_by_id(topic_id)
    assert_nil re_topic
  end
end
