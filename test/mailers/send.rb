require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :address => "smtp.163.com",
    :port => 25,
    :domain => "www.163.com",
    :user_name => "ioioinfo@163.com",
    :password => "ioioinfo123321",
    :authentication => :login,
    :enable_starttls_auto => false
  }
end

Mail.deliver do
  to 'haimingluo@ioioinfo.com'
  from 'ioioinfo@163.com'
  subject 'testing'
  body 'hello'
end
