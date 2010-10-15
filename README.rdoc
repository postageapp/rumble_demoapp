= Rails Rumble PostageApp Demo App

This is a simple demonstration app for PostageApp. To make it work you will
need to configure config/initializers/postageapp.rb with your API key:

    PostageApp.configure do |config|
      config.api_key = 'EXAMPLE_API_KEY'
    end

Several templates are required for this to work, but they are described in
the blog post:

http://blog.postageapp.com/2010/10/rails-rumble/
