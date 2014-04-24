require 'spec_helper'

feature "Update Menu" do
	
	given(:menu) do
		FactorysGirl.create(:menu)
	end

	scenario "shoud not allow me to visit the edit page without being an admin" do
	  visit edit_menu_path(menu)
	  page.should have_content('Salut')
	end

	scenario "should allow me to update the proper menu when logged in as admin" do
		admin = FactoryGirl.create(:admin)
	  	visit '/admins/sign_in' 
	  	fill_in "Email", with: admin.email
	  	fill_in "Password", with: admin.password
	  	click_button 'Log in'
		
		visit edit_menu_path(menu)
		page.should have_content "Edit #{menu.name}"
		fill_in "Name", with: 'Babou'
	    click_button "Update Menu"
	    page.should have_content('Babou')
	end		

end

feature "Display Properly Menu" do
	given(:menu) do
		FactoryGirl.create(:menu)
	end

	scenario "displays the proper menu" do
		dish_1 = FactoryGirl.create(:dish, :column => 1, :menu_id => menu.id)
		dish_2 = FactoryGirl.create(:dish, :column => 2, :menu_id => menu.id)
		visit menu_path(menu)
		page.should have_content menu.name
		page.should have_selector("#column_1 #dish_#{dish_1.id}")
		page.should have_selector("#column_2 #dish_#{dish_2.id}")


	end

end
