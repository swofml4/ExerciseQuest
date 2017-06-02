json.extract! bodypart, :id, :name, :created_at, :updated_at
json.url bodypart_url(bodypart, format: :json)
