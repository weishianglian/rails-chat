class ApplicationController < ActionController::Base
  def initialize
    if ENV["STREAM_URL"].blank?
      api_key = ["STREAM_API_KEY"]
      api_secret = ["STREAM_API_SECRET"]
    else
      api_key, api_secret = ENV["STREAM_URL"][8..].split("@")[0].split(":")
    end

    @chat = StreamChat::Client.new(api_key=api_key, api_secret=api_secret)
    @dialogflow = Google::Cloud::Dialogflow::Session.new
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
