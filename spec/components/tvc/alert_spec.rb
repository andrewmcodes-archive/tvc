require "spec_helper"

RSpec.describe(TVC::Alert, type: :component) do
  let(:node) { Capybara::Node::Simple.new(render_inline(component).to_html) }
  let(:text) { "Some warning" }

  context "default behaviour" do
    let(:component) { TVC::Alert.new(message: text) }

    context "containing div" do
      subject { node.find(".bg-pink-500") }
      it { is_expected.to have_css("span", class: "inline-block", text: "!") }
    end
  end
end
