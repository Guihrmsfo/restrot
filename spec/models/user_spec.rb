require 'rails_helper'

RSpec.describe User, type: :model do
  it "has valid attributes" do
    expect(User.new).to be_valid
  end

  it "has empty email" do
    u = create(:name, :password, :email=> nil)
    expect(u).to have(1).errors_on(:email)
  end
  
  it "has empty name" do
    u = create(:email, :password, :name=> nil)
    expect(u).to have(1).errors_on(:name)
  end
  
  it "has passwords that dont match" do
    u = create(:name, :email, :password => "p1", :confirmation => "p2")
    expect(u).to have(1).errors_on(:password)
  end
  
  it "username already taken" do
    u = User.new
    user_test = User.find_by name: u.name
    expect(@user_test).to be_nill
  end
  
  it "email already taken" do
    u = User.new
    user_test = User.find_by name: u.name
    expect(@user_test).to be_nill
  end
  
  it "password too short" do
    u = User.new
    should validate_length_of(u.password).is_at_least(6)
  end
end
