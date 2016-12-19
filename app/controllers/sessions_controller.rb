class SessionsController < ApplicationController
 def new
     
 end

 def create
  user = User.find_by(email: user_params[:email])
  #.try(:authenticate, user_params[:password])
  if user
    if user.password != user_params[:password]
        flash.now[:login_error] = "用户名/密码错误"
        return render "new"
    end
    if !user.is_actived
        flash.now[:login_error] = "用户未激活"
        return render "new"
    end
    session[:user_id] = user.id
    redirect_to "/user/index"
  else
    flash.now[:login_error] = "invalid username or password"
    render "new"
  end
end
 
 private
  def user_params
   params.require(:session).permit(:email, :password)
  end
  end