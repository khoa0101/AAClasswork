require 'rails_helper'

RSpec.describe User, type: :model do
  #need username, password_digest
  #users should have goals
  
  describe 'validations' do

    subject(:jug) { User.new(username: 'jug', password: '123456') }

    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}

    it { should validate_length_of(:password).is_at_least(6)}

    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:session_token)}

    it { should have_many(:goals)}
    it { should have_many(:comments)}

  end

  #associations
  #a user has many goals
  #have many comments on others goals

  #class_scope methods
    #find_by_credential
    #password?
    #is_password? or password?
    #reset_session_token
  describe 'password encryption' do

    let(:user) { FactoryBot.build(:user) }

    # it "does not save password to the database" do
    #   FactoryBot.create(:harry_potter)

    #   user = User.find_by(username: 'Harry Potter')
    #   expect(user.password).not_to eq('password')
    # end

    it 'should encrypt the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with("string")

      FactoryBot.build(:user, password: 'string')

    end

  end



end

