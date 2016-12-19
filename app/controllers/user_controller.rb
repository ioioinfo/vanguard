require "uuidtools"
require 'rubygems'

class UserController < ApplicationController
    def index
        user_id = session[:user_id]
        if user_id.nil?
            redirect_to :sessions_new
        end
    end

    def save
        uploaded_io = params[:usericon]
        # save the original_filename,then alter
        #filename = uploaded_io.original_filename
        filename = uploaded_io.original_filename
        filename = UUIDTools::UUID.random_create.to_s+File.extname(filename)
        File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end

        user=User.find(session[:user_id])
        user.nickname=params[:nickname]
        user.usericon=filename
        user.save
    end
end