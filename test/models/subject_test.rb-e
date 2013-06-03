require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test "should not save without subject name" do
    subject = Subject.new
    subject.uuid = "123"
    assert ! subject.save
  end

  test "should create a default UUID" do
    subject = Subject.new
    subject.subject_name = "123"
    assert subject.uuid != nil
    assert subject.save
  end

  test "should save with subject name & UUID" do
    subject = Subject.new                   
    subject.subject_name = "abc"
    subject.uuid = "123"
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
end
