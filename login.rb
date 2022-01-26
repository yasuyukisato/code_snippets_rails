class ApplicationController < ActionController::Base
  before_action :require_login

  private

  # ログインしていなければ、登録画面へ遷移させるメソッド
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end


# skip_before_actionメソッドを使えば、特定のアクションでフィルタをスキップできる
class LoginsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
end
# LoginsControllerのnewアクションとcreateアクションをこれまでどおり認証不要にする

puts 'aaa'
