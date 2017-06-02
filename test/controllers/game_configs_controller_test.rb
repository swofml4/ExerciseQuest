require 'test_helper'

class GameConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_config = game_configs(:one)
  end

  test "should get index" do
    get game_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_game_config_url
    assert_response :success
  end

  test "should create game_config" do
    assert_difference('GameConfig.count') do
      post game_configs_url, params: { game_config: { decay_per_day: @game_config.decay_per_day, level_method: @game_config.level_method, level_rate: @game_config.level_rate } }
    end

    assert_redirected_to game_config_url(GameConfig.last)
  end

  test "should show game_config" do
    get game_config_url(@game_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_config_url(@game_config)
    assert_response :success
  end

  test "should update game_config" do
    patch game_config_url(@game_config), params: { game_config: { decay_per_day: @game_config.decay_per_day, level_method: @game_config.level_method, level_rate: @game_config.level_rate } }
    assert_redirected_to game_config_url(@game_config)
  end

  test "should destroy game_config" do
    assert_difference('GameConfig.count', -1) do
      delete game_config_url(@game_config)
    end

    assert_redirected_to game_configs_url
  end
end
