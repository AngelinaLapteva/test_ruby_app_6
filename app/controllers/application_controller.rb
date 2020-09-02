class ApplicationController < ActionController::Base
  def hello
    # now in this methond we need to specify our template to show
    # render html: 'Hello world'
    # but instead it is better to use html.erb files from views/layouts folder
  end
end
