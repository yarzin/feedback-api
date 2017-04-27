require 'rails_helper'

RSpec.describe Feedback, type: :model do
	it { should validate_presence_of(:age) }
	it { should allow_value("Ostap Ferneza").for(:name) }
	it { should allow_value("2017-08-22").for(:date) }
end
