class User < ActiveRecord::Base
   has_many :user_groups
   has_many :groups, :through => :user_groups
   
  def validate
    #验证email是否符合规范
    errors.add("", "电子邮件必须匹配电子邮件规则") unless email =~ /^\w+@\w+.[a-zA-Z]{2,6}$/   

    #验证password不能为空
    errors.add("", "密码只能是字母或数字，且长度必须为4到20位") unless pass =~ /^[a-zA-Z0-9]{4,20}$/    

    #验证email不能是一个数据库中已经存在的名字   
    errors.add("", "用户名不能重复，您选择的用户名已经存在") unless User.find_by_name(email).nil?    
  end
end
