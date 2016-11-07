require 'rails_helper'

RSpec.describe Ingredient, type: :model do
    subject {described_class.new(name: "Any Name", unit_of_measure: "Any Measure")}
    
    it "has valid attributes" do
       expect(subject).to be_valid
    end
end
