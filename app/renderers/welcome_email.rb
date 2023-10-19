# app/renderers/welcome_email.rb

module Bookshelf
  module Renderers
    class WelcomeEmail
      def render_html(name:)
        "<p>Welcome to Bookshelf #{name}!</p>"
      end

      def render_text(name:)
        "Welcome to Bookshelf #{name}!"
      end
    end
  end
end
