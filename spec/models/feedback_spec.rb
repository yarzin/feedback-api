require 'rails_helper'

RSpec.describe Feedback, type: :model do
	it { should validate_presence_of(:age) }
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:date) }
end
