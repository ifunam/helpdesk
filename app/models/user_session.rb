class UserSession < Authlogic::Session::Base
require_password_confirmation=false
validate_password_field=false

end