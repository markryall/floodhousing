class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
end