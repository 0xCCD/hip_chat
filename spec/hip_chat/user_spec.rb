require "spec_helper"

describe HipChat::User do
  it "includes HipChat::CommonMethods" do
    expect(described_class.included_modules).to include HipChat::CommonMethods
  end
end
