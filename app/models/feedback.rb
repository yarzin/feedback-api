class Feedback < ApplicationRecord
	validates_format_of :name, presence: true, :with => /([A-Z]+[a-z]{2,}\s[A-Z]+[a-z]{2,}$)/, :message => "Name must be in the following format: Name Surname"
	validates :age, presence: true, inclusion: { in: 17..65 }
	validates_format_of :date, presence: true, :with => /\d{4}\-\d{2}\-\d{2}/, :message => "Date must be in the following format: yyyy-mm-dd"
end
