require 'json'  
class GroupsController < ApplicationController

    def index
        @groups = Group.all
        @users = User.all
    end
    
    def add
        @groups = Group.new
        if request.get?
          @groups.groupname = params[:groupname]
          @groups.save
        end
                
        render :json => @groups.to_json
   end
   
   def addnewstaff
       users = []
       user_ids = JSON.parse(params[:json])  #解析成JSON Object
       group_id = params[:dataid]
       user_ids.each do |user_id| 
           user = User.find_by_id(user_id)
           
           @staff = UserGroup.new
           @staff.user_id = user_id
           @staff.group_id = group_id
           if @staff.save
               users.push(user)
           end
       end
   
      ret = Hash.new
      ret["group_id"] = group_id
      ret["users"] = users
      
      render :json => ret.to_json
   end
    
    def deletegroup
        group_id=params[:groupid]
        UserGroup.delete_all(group_id:group_id)
        Group.destroy(group_id)
        
        ret = Hash.new
        ret["group_id"] = group_id
      
        render :json => ret.to_json
    end
    
end