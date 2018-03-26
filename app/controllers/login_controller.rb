class LoginController < ApplicationController
  def signup

  end

  def test
  	info_from_form = params['username']['password']
  	@user = User.new
  end

  def new
  	@user = User.new
  end


  def index
  	@users = Users.all
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :other_stuff)
  end

  def userlogin
  end
end
