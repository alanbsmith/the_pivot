class Administrator::UsersController < AdminsController
  before_action :lookup_user, only: [:edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @users = User.all
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to administrator_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def user_params
    params.require(:user).permit(:email,
                                 :first_name,
                                 :last_name,
                                 :street,
                                 :city,
                                 :state,
                                 :zipcode
                                 )
    end

    def lookup_user
      @user = User.find(params[:id])
    end
end
