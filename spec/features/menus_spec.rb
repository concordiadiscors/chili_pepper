require 'spec_helper'


feature "Update Menu" do
	
 let(:menu) {FactoryGirl.create(:chili_pepper_menu)}

	scenario "shoud not allow me to visit the new page without being an admin" do
	  # visit "/chili_pepper/menus/new"
    visit chili_pepper.edit_menu_path(menu)
	  expect(page).not_to have_content('New')
	end

	scenario "should allow me to add a menu when logged in as admin" do
    admin = FactoryGirl.create(:chili_pepper_admin)
    visit 'chili_pepper/admins/sign_in' 
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button 'Sign in'
		
		visit "/chili_pepper/menus/new"
		page.should have_content "New Menu"
		# fill_in "Name", with: 'Babou'
	 #    click_button "Update Menu"
	 #    page.should have_content('Babou')
	end		

# end

# feature "Display Properly Menu" do
# 	given(:menu) do
# 		FactoryGirl.create(:menu)
# 	end

# 	scenario "displays the proper menu" do
# 		dish_1 = FactoryGirl.create(:dish, :column => 1, :menu_id => menu.id)
# 		dish_2 = FactoryGirl.create(:dish, :column => 2, :menu_id => menu.id)
# 		visit menu_path(menu)
# 		page.should have_content menu.name
# 		page.should have_selector("#column_1 #dish_#{dish_1.id}")
# 		page.should have_selector("#column_2 #dish_#{dish_2.id}")


# 	end

end
