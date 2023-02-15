class UserSessionsController < ApplicationController
  def new; end

  def guest_login
    random_value = SecureRandom.hex
    password = SecureRandom.alphanumeric(10)
    guest_user = User.create(
    name: random_value,
    email: "#{random_value}@example.com",
    password: password,
    password_confirmation: password
    )
    auto_login(guest_user)
    redirect_to root_path
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
