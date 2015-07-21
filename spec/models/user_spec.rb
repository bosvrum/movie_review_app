require 'rails_helper'

describe "A user" do

  it "requires a name" do
    user = User.new(name: "")

    user.valid? # populates errors

    expect(user.errors[:name].any?).to eq(true)
  end

  it "requires an email" do
    user = User.new(email: "")

    user.valid?

    expect(user.errors[:email].any?).to eq(true)
  end

  it "accepts properly formatted email addresses" do
    emails = %w[user@example.com first.last@example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it "requires a password" do
    user = User.new(password: "")

    user.valid?

    expect(user.errors[:password].any?).to eq(true)
  end

  it "requires a password confirmation when a password is present" do
    user = User.new(password: "secret", password_confirmation: "")

    user.valid?

    expect(user.errors[:password_confirmation].any?).to eq(true)
  end

  it "requires the password to match the password confirmation" do
    user = User.new(password: "secret", password_confirmation: "nomatch")

    user.valid?

    expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
  end

  it "automatically encrypts the password into the password_digest attribute" do
    user = User.new(password: "secret")

    expect(user.password_digest.present?).to eq(true)
  end
end