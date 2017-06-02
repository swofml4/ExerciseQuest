json.extract! workout, :id, :user_id, :exercise_id, :reps, :created_at, :updated_at
json.url workout_url(workout, format: :json)
