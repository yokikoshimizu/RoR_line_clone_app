class MessageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_receiver

  # この部分のコードが調べてもいまいち全体的に理解できませんでした
  def index
    @messages = Message.where(
      "(sender_id = :current AND receiver_id = :receiver) OR (sender_id = :receiver AND receiver_id = :current)",
      current: current_user.id,
      receiver: @receiver.id
    ).order(:created_at)
  end

  def create
  end
end
