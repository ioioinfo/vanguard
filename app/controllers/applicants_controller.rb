class ApplicantsController < ApplicationController
  require 'securerandom'   
  
  def new
     @user=User.new   
  end

  def create
    @user = User.create(user_params)
    
    # generate the random_code 
    @user.active_code = SecureRandom.hex 6
    
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      puts @user.email
      UserMailer.welcome_email(@user).deliver_later   
      redirect_to :sessions_new
    else
       render :action => :new
    end
  end
  
  def verify
    @userid=params[:userid]
    puts @userid
    
    @active_code=params[:active_code]
    
    if @userid.blank? || @active_code.blank?
        @msg = "参数错误"
        return
    end
    
    user = User.find_by(id:@userid)
    if user.blank?
        @msg = "用户不存在"
        return 
    end
    
    if user.is_actived
        @msg = "用户已激活"
        return
    end
    
    if @active_code != user.active_code
        @msg = "用户信息不一致"
        return
    else 
        user.is_actived = 1
        user.save
        
        @msg = "激活成功"
    end
  end
 
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
  
end