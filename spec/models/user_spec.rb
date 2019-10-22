require 'rails_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :google_token }
    it { should validate_presence_of :email }
  end
end
