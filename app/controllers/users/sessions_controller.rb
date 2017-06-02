class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if user_signed_in?
      bodyparts = Bodypart.all
      tmp_stats = UserStat.where('user_id = ?', current_user.id)
      bodyparts.each do |bodypart|
        if tmp_stats.where('bodypart_id = ?', bodypart.id).empty?
          UserStat.create(user_id: current_user.id, bodypart_id: bodypart.id, base_points: 0, level_points: 0)
        end
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
