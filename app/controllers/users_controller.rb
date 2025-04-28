class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    # Userテーブルから、自分のID以外の全ユーザーを取得して @users に代入する
    # ⇒自分以外のユーザーにだけ「友達に追加」ボタンを出すことができる
    # User.where(...) 「Userテーブルから条件に合うレコードを取り出す」 という命令
    @users = User.where.not(id: current_user.id)
  end
end
