require 'rails_helper'

describe "Viewing the list of users" do

  it "shows the users" do
    user1 = User.create!(user_attributes(name: "Larry", email: "larry@example.com"))
    user2 = User.create!(user_attributes(name: "Moe",   email: "moe@example.com"))
    user3 = User.create!(user_attributes(name: "Curly", email: "curly@example.com"))

    visit users_url

    expect(page).to have_link(user1.name)
    expect(page).to have_link(user2.name)
    expect(page).to have_link(user3.name)
  end
  it "shows the user's details" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit user_url(user)

    expect(page).to have_text(user.name)
    expect(page).to have_text(user.email)
  end

end