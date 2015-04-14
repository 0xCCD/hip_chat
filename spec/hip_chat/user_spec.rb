require "spec_helper"

describe HipChat::User, {webmock: true} do
  it "includes HipChat::CommonMethods" do
    expect(described_class.included_modules).to include HipChat::CommonMethods
  end
end
