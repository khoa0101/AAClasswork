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

  end

end

