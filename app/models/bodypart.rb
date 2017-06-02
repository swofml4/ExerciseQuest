class Bodypart < ApplicationRecord
	has_and_belongs_to_many :exercises
	has_many :user_stats
end
