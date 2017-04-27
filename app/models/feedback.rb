class Feedback < ApplicationRecord
	validates :age, :name, :date, presence: true
end
