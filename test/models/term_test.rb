require 'test_helper'

class TermTest < ActiveSupport::TestCase
  test "must belong to a topic" do
    term = Term.new :question => "abc", :answer => "321"
    assert ! term.save
  end
  
  test "should not save without question" do
    term = Term.new :answer => "321"
    term.topic_id = 1
    assert ! term.save
  end

  test "should not save without answer" do
    term = Term.new :question => "213"
    term.topic_id = 1
    assert ! term.save
  end

  test "should create a default UUID" do
    term = Term.new
    assert term.uuid != nil
  end

  test "should save with term question, answer, and UUID" do
    term = Term.new                   
    term.topic_id = 1
    term.question = "abc"
    term.answer = "321"
    assert term.save
  end
  
  test "should not allow duplicate UUIDs" do
    term = Term.new                   
    term.topic_id = 1
    term.question = "abc"
    term.answer = "321"
    term.uuid = "abc123"
    assert term.save
    
    term = Term.new                   
    term.topic_id = 1
    term.question = "abc"
    term.answer = "321"
    term.uuid = "abc123"
    assert ! term.save
  end
  
# test "should not allow duplicate questions in one topic" do
#   term = Term.new :topic_id => 1, :question => "abc", :answer => "123"
#   assert term.save
#
#   term = Term.new :topic_id => 1, :question => "abc", :answer => "123"
#   assert ! term.save
# end
# 
# test "should allow duplicate questions in different topics"
end
