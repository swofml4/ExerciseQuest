json.extract! game_config, :id, :level_rate, :level_method, :decay_per_day, :created_at, :updated_at
json.url game_config_url(game_config, format: :json)
