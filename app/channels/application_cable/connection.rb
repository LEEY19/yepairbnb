module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include ApplicationHelper
    identified_by :current_user

 
    def connect
      self.current_user = User.where(remember_token: cookies[:remember_token]).first
      logger.add_tags 'ActionCable', User.where(remember_token: cookies[:remember_token]).first.email
    end
 
    # protected
      
    # def find_verified_user
    #   byebug
    #   (current_user = env['warden'].user) ? current_user : reject_unauthorized_connection
    # end

  end
end
