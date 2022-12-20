class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: "#{t('password_resets.notice1')}"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "#{t('password_resets.alert1')}"
  end

  def update
    @user = User.find_signed( params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "#{t('password_resets.notice1')}"
    else
      flash[:alert] = "#{t('password_resets.alert2')}"
      redirect_to password_reset_edit_path(token: params[:token])
    end

  end


  private 

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end