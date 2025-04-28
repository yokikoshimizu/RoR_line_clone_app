class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Deviseで追加された認証機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 自分が送った友達申請（複数の友達登録ができる＝友達関係を持てる）
  # 実際は friendships テーブルの user_id を使って関連付けがされる
  has_many :friendships

  # 友達一覧（Userの集合）
  # Userは `friendships` を通じて `friends`（User）と関係を持つ」という構文
  # ここでの　friends　は、Userモデルの別のインスタンス（自分以外のユーザー）
  has_many :friends, through: :friendships

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
end
