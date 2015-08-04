require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post :create, subscription: { card_expires_on: @subscription.card_expires_on, card_type: @subscription.card_type, first_name: @subscription.first_name, ip_address: @subscription.ip_address, last_name: @subscription.last_name, new: @subscription.new, user_id: @subscription.user_id }
    end

    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should show subscription" do
    get :show, id: @subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription
    assert_response :success
  end

  test "should update subscription" do
    patch :update, id: @subscription, subscription: { card_expires_on: @subscription.card_expires_on, card_type: @subscription.card_type, first_name: @subscription.first_name, ip_address: @subscription.ip_address, last_name: @subscription.last_name, new: @subscription.new, user_id: @subscription.user_id }
    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete :destroy, id: @subscription
    end

    assert_redirected_to subscriptions_path
  end
end
