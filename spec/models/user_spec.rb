require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name and email' do
    user = build(:user)
    expect(user).to be_valid
  end
  
  it 'is not valid without name' do
    user = build(:user)
    user.name = '   '
    expect(user).to_not be_valid
  end
  
  it 'is not valid without email' do
    user = build(:user)
    user.email = '   '
    expect(user).to_not be_valid
  end
  
  it 'has too long name' do
    user = build(:user)
    user.name = 'a'*51
    expect(user).to_not be_valid
  end
  
  it 'has too long email' do
    user = build(:user)
    user.email = "a" * 244 + "@example.com"
    expect(user).to_not be_valid
  end
  
  it 'should have uniqueness email' do
    user = build(:user)
    duq_user = user.dup
    duq_user.email = user.email.upcase
    user.save
    expect(duq_user).to_not be_valid
  end
  
  it 'should be saved email as lower-case' do
    user = build(:user)
    mixed_case_email = "Foo@ExAMPle.CoM"
    user.email = mixed_case_email
    user.save
    expect(user.reload.email).to eq(mixed_case_email.downcase)
  end
end
