require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(name: 'Amaal Ali', email: "amaal@1.com", password:'LHLSchool', password_confirmation:'LHLSchool')
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid passwords do not match" do
    @user.password_confirmation = 'LHLisTheSchool'
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "has a valid password" do
    @user= User.new(name: "Amaal Ali", email: 'amaal@1.com', password:"", password_confirmation: "")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "has a unique email" do
    @user1= User.create(name: 'Amaal Ali', email: 'amaaaal@1.com', password:'LHLSchool', password_confirmation:'LHLSchool')
    @user2= User.create(name: 'Amaal Ali', email: 'AMAAAAL@1.COM', password:'LHLSchool', password_confirmation:'LHLSchool')
    @user1.email = @user2.email
    expect(@user1).to be_valid
    expect(@user2.errors.full_messages).to include("Email has already been taken")
  end

  it "is not valid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end
  it 'requires a password with at least 4 characters' do
    @user.password = 'eas'
    @user.password_confirmation = 'eas'
    expect(@user).not_to be_valid
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    
  end

  describe '.authenticate_with_credentials' do


        it "returns user object for valid email and password" do 
        User.create(email: "amaal@1.com", password: 'LHLSchool', password_confirmation: 'LHLSchool')
          result = User.authenticate_with_credentials("amaal@1.com", 'LHLSchool')
          expect(result).not_to be_nil
          expect(result).to be_a User
        end
    
        it "returns nil for invalid email " do 
          result = User.authenticate_with_credentials("amaaaal@1.com", 'LHLSchool')
        expect(result).to be_nil 
          
        end
    
        it "returns nil for invalid password" do 
        result = User.authenticate_with_credentials("amaaaal@1.com", 'LHLSchhoool')
        expect(result).to be_nil 
        end
    
        it "returns valid email even with spaces" do 
        result = User.authenticate_with_credentials(" amaal@1.com ", 'LHLSchool')
          expect(result).to be_a User
        end
    
    
        it "returns valid email without case sensitivity" do 
          result = User.authenticate_with_credentials("AMAAL@1.COM", 'LHLSchool')
          expect(result).to be_a User
        end
    
      end

end
