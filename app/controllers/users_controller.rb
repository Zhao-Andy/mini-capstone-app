class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save # if false, it won't save it. So if the passwords don't match, then false.
      session[:user_id] = @user.id
      flash[:success] = "Thanks for creating an account!"
      redirect_to '/products'
    else
      flash[:warning] = "Passwords don't match!"
      redirect_to '/signup'
    end
  end
end
