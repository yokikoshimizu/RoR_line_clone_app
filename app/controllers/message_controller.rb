class MessageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_receiver
  def index
  end

  def create
  end
end
