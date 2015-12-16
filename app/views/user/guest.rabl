object false

node(:logged_in) { false }

node :csrf_token do |u|
  form_authenticity_token
end
