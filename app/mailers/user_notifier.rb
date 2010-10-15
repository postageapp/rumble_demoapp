class UserNotifier < PostageApp::Mailer
  # Sends an invitation email for a team from a user to a number of
  # emails provided as an array.
  def invitation(team, user, emails)
    # Use the "invitation" template
    postageapp_template 'invitation'

    # Set up variables that apply to all messages sent
    postageapp_variables :team_name => ERB::Util.h(team),
      :user_name => ERB::Util.h(user)
    
    # Create customized variables for each recipient
    recipient_list = { }
    
    emails.each do |email|
      recipient_list[email] = {
        # Each new sign-up is tracked by referral
        :signup_link => new_signup_url(:email => email, :referral => user, :team => team)
      }
    end

    # Send the message using the API
    mail(
      :from => 'test@example.com',
      :to => recipient_list
    )
  end
end
