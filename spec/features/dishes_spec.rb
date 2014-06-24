require 'spec_helper'

feature 'Only Allows Admin to manage sections' do
  
 let(:section) {FactoryGirl.create(:chili_pepper_section, :menu => menu)}
 let(:dish) {FactoryGirl.create(:chili_pepper_dish)}

 scenario 'shoud not allow me to visit the new or edit pages without being an admin' do
   visit chili_pepper.new_dish_path
   expect(page).not_to have_content('New Dish')
   visit chili_pepper.edit_dish_path(dish)
   expect(page).not_to have_content('Edit')
 end

end

feature 'allows admins to manage sections' do

  let(:section) {FactoryGirl.create(:chili_pepper_section)}
  let(:dish) {FactoryGirl.create(:chili_pepper_dish)}

  before :each do
    admin = FactoryGirl.create(:chili_pepper_admin)
    visit 'chili_pepper/admins/sign_in' 
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
  end

  scenario 'adds a dish' do
   
    visit chili_pepper.new_dish_path(:section_id => section.id)
    expect(page).to have_content 'New Dish'
    fill_in 'Name', with: 'DishBabou'
    click_button 'Create Dish'
    expect(current_path).to eq(chili_pepper.menu_section_path(section.menu, section))
    # expect(page).to have_content('DishBabou')
  end

  # scenario 'edit menu' do
  #   visit chili_pepper.edit_dish_path(menu, section)
  #   expect(page).to have_content('Edit')
  #   fill_in 'Name', with: 'PoteSection Edited'
  #   click_button 'Update Section'
  #   expect(current_path).to eq(chili_pepper.dish_path(menu, section))
  #   expect(page).to have_content('PoteSection Edited')
  # end

  # scenario 'allows to delete menu' do
  #   visit chili_pepper.dish_path(menu, section)
  #   within("li#section_1") do
  #     click_link 'Delete Section'
  #   end
  #   expect(current_path).to eq(chili_pepper.menu_path(menu))
  # end

end
