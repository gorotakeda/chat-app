class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      # current_userメソッドを使用して、ログインしているユーザーの情報を更新します。
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
    # user_paramsの中でpermitメソッドを使用し、「name」と「email」の編集を許可します。
  end
end
