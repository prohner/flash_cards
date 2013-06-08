require 'test_helper'

class TermsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
    @term = terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:terms)
  end

  test "should get new" do
    get :new, { topic_id: @topic.id }
    assert_response :success
  end

  test "should create term" do
    assert_difference('Term.count') do
      post :create, term: { topic_id: @topic.id, answer: @term.answer, question: @term.question }
    end

    assert_redirected_to term_path(assigns(:term))
  end

  test "should show term" do
    get :show, id: @term
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @term
    assert_response :success
  end

  test "should update term" do
    @topic.terms << @term
    @topic.save!
    patch :update, id: @term, term: { answer: @term.answer, question: @term.question, uuid: SecureRandom.uuid }
    assert_redirected_to term_path(assigns(:term))
  end

  test "should destroy term" do
    assert_difference('Term.count', -1) do
      delete :destroy, id: @term
    end

    assert_redirected_to terms_path
  end
end
