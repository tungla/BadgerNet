# InvitationsController is a super class on the default devise invitations controller
# which allows us to take in custom form fields when a user signs up for their name, etc.
class InvitationsController < Devise::InvitationsController
  before_action :update_sanitized_params, only: :update

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  # PUT /resource/invitation
  def update
    respond_to do |format|
      format.js do
        invitation_token = Devise.token_generator.digest(
          resource_class, :invitation_token, update_resource_params[:invitation_token]
        )
        self.resource = resource_class.where(invitation_token: invitation_token).first
        resource.skip_password = true
        resource.update_attributes update_resource_params.except(:invitation_token)
      end
      format.html do
        super
      end
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys:
     %i[name password password_confirmation invitation_token avatar avatar_cache
        first_name last_name phone]) # our desired custom params
  end
end
