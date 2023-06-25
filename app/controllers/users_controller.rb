class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
       redirect_to root_path
       flash[:email] = "Your message was successfully sent."
    else
        flash.now[:error] = 'Invalid email/password combination'
         render 'new'
    end
  end
  def show
    @user = User.find_by(id: params[:user_id])
    @posts =@user.posts.all
  end
  def edit
       @user = User.find_by(id: params[:user_id])
  end

  def update 
      @user = User.find_by(id: params[:user_id])
     if @user.update(user_params)
       flash[:success] = "Profile updated"
       redirect_to users_show_path(@user.id)
     else
        render :edit
     end
  end
  def destroy
    @user=User.find_by(id: params[:user_id]).destroy
      redirect_to root_path
  end

    private
    def user_params
       params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end