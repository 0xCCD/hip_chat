require "spec_helper"

describe HipChat::Relation do
  it "inherits from Array" do
    expect(described_class.ancestors).to include Array
  end

  describe "instance" do
    let(:token) { "some_token" }
    let(:list) { [1, 2, 3] }
    let(:list_class) { Struct.new(:token, :element) }
    let(:expected) do
      list.map { |element| list_class.new(token, element) }
    end
    let(:instance) { described_class.new(token, list, list_class) }

    describe "initialization" do
      subject { instance }
      it { should match_array expected }
    end

    describe "method delegation" do
      let(:arg) { 1 }

      %w{
        find
        create
        create!
      }.each do |method_name|
        context method_name do
          before { expect(list_class).to receive(method_name).with(token, arg).once }
          specify { instance.public_send(method_name, arg) }
        end
      end
    end
  end
end
