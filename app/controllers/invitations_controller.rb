class InvitationsController < ApplicationController
  def index
    redirect_to(new_invitation_path)
  end
  
  def new
  end
  
  def create
    @team = params[:team]
    @user = params[:user]
    @emails = params[:emails] && params[:emails].reject(&:blank?)
    
    if (@team.present? && @user.present? && @emails.present?)
      UserNotifier.invitation(@team, @user, @emails).deliver
    else
      flash.now[:error] = 'Please enter a team name, user name and at least one email address'
      render(:action => 'new')
    end
  end
end
