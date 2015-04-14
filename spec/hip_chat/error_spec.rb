require "spec_helper"

describe HipChat::Error do
  it "inherits from StandardError" do
    expect(described_class.ancestors).to include StandardError
  end
end
