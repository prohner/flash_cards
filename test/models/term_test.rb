require 'test_helper'

class TermTest < ActiveSupport::TestCase
  test "should not save without question" do
    term = Term.new
    term.answer = "213"
    assert ! term.save
  end

  test "should not save without answer" do
    term = Term.new
    term.question = "213"
    assert ! term.save
  end

  test "should create a default UUID" do
    term = Term.new
    assert term.uuid != nil
  end

  test "should save with term question, answer, and UUID" do
    term = Term.new                   
    term.question = "abc"
    term.answer = "321"
    term.uuid = "123"
    assert term.save
  end
  
  test "should not allow duplicate UUIDs" do
    term = Term.new                   
    term.question = "abc"
    term.answer = "321"
    term.uuid = "abc123"
    assert term.save
    
    term = Term.new                   
    term.question = "abc"
    term.answer = "321"
    term.uuid = "abc123"
    assert ! term.save
    
  end
end
