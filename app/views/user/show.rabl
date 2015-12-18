object @user

attributes :id, :user_name, :email, :age

node(:logged_in) { true }

node :csrf_token do |u|
  form_authenticity_token
end

child :movies do
  extends('movies/_base')
end
