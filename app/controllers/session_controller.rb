class SessionController < ApplicationController

  def destroy
    # session.delete(:location)
    reset_session
    redirect_to root_path
  end
end
