require 'rails_helper'

RSpec.describe "Registering User" do
  it "creates new user" do
    visit "/register"

    click_button 'Register with Google Account'

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      { provider: "github",
        uid:"16658577",
        info:
        { nickname: "MackHalliday",
          email: nil,
          name: "Mack Halliday",
          image: "https://avatars2.githubusercontent.com/u/16658577?v=4",
          urls:
            { GitHub: "https://github.com/MackHalliday",
              Blog: "www.linkedin.com/in/mackenziehalliday"}},
        credentials:
          { token: "823fa3e72e05b186905ec6472f7baff0fd95640b",
            expires: false}})

    expect(current_path).to eq("/profile")

    user = User.last

    expect(user.email).to eq("mackenzie.halliday@gmail.com")
    expect(user.first_name).to eq("Mackenzie")
    expect(user.last_name).to eq("Halliday")
  end
end
