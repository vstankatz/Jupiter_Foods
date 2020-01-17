require 'rails_helper'

describe Review do
it { should belong_to(:product) }
it { should validate_presence_of :author, :content, :rating }
it { should validate_length_of(:content).is_at_least(50) }
it { should validate_length_of(:content).is_at_most(250) }
end
