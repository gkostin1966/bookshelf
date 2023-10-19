# spec/unit/operations/send_welcome_email_spec.rb

RSpec.describe Bookshelf::Operations::SendWelcomeEmail, "#call" do
  subject(:send_welcome_email) {
    described_class.new(email_client: email_client, email_renderer: email_renderer)
  }

  let(:email_client) { double(:email_client) }
  let(:email_renderer) { double(:email_renderer) }

  before do
    allow(email_renderer).to receive(:render_text).and_return("Welcome to Bookshelf Ada!")
    allow(email_renderer).to receive(:render_html).and_return("<p>Welcome to Bookshelf Ada!</p>")
  end

  it "sends a welcome email" do
    expect(email_client).to receive(:deliver).with(
      to: "ada@example.com",
      subject: "Welcome!",
      text_body: "Welcome to Bookshelf Ada!",
      html_body: "<p>Welcome to Bookshelf Ada!</p>"
    )

    send_welcome_email.call(name: "Ada!", email_address: "ada@example.com")
  end
end
