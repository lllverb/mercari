class SignupController < ApplicationController
  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new
  end
  
  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end
  
  def step4
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:house_number] = user_params[:house_number]
    session[:building_name] = user_params[:building_name]
    @user = User.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name]
    )

    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      flash[:notice] = 'もう一度'
      render '/signup/step1'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :profile_image,
      :phone_number,
      :house_number,
      :building_name
    )
    .merge(
      postal_code: params[:zip01],
      prefecture: params[:pref01],
      city: params[:addr01]      
    )
  end
end

