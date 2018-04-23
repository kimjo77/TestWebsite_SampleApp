class ApplicationController < ActionController::Base
  def say_hello
    render html: "Hello World! Chapter 3!"
  end
end
