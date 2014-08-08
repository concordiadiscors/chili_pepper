 module ControllerMacros
   def login_admin
     before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:chili_pepper_admin]
       admin = FactoryGirl.create(:chili_pepper_admin)
       sign_in admin
     end
   end
 end