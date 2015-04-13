require "spec_helper"

describe HipChat::Api do
  describe "authorization" do
    let(:token) { "hip_chat_api_token" }
    subject { described_class.new(token) }

    context "invalid token" do
      before do
        stub_unauthorized_access(token)
      end

      it "raises error" do
        expect { subject }.to raise_error HipChat::Error
      end
    end

    context "valid token" do
      before do
        stub_authorized_access(token)
      end

      it "does not raise error" do
        expect { subject }.to_not raise_error
      end

      it "automatically fetches users" do
        users = subject.users

        expect(users).to_not be_empty

        users.each do |user|
          expect(user).to be_a HipChat::User
        end
      end
    end
  end
end
