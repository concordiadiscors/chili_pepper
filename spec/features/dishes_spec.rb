require 'spec_helper'

feature 'Only Allows Admin to manage sections' do

   let(:menu) {FactoryGirl.create(:chili_pepper_menu)}
   let(:section) {FactoryGirl.create(:chili_pepper_section, :menu => menu)}
   let(:dish) {FactoryGirl.create(:chili_pepper_dish)}  

 scenario 'does not allow non-admin me to visit the new or edit pages' do
   visit chili_pepper.new_dish_path
   expect(page).not_to have_content('New Dish')
   visit chili_pepper.edit_dish_path(dish)
   expect(page).not_to have_content('Edit')
 end

 scenario 'displays all dishes in give section' do
    created_column_1 = FactoryGirl.create_list(:chili_pepper_item, 4, :column => 0)
    created_column_2 = FactoryGirl.create_list(:chili_pepper_item, 4, :column => 1)
    section.items << created_column_1
    section.items << created_column_2
    visit chili_pepper.menu_path(menu)
    expect(page).to have_selector('#menu_content ul.column', count: 2 )
    expect(page).to have_selector('ul.column li', count: 8 )

 end

end

feature 'allows admins to manage sections' do

  let(:menu) {FactoryGirl.create(:chili_pepper_menu)}
  let(:section) {FactoryGirl.create(:chili_pepper_section, :menu => menu)}
  let(:dish) {FactoryGirl.create(:chili_pepper_dish)}

  before :each do
    admin = FactoryGirl.create(:chili_pepper_admin)
    visit 'chili_pepper/admins/sign_in' 
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    menu.sections << section
  end

  scenario 'adds a dish' do
    visit chili_pepper.menu_section_path(section.menu, section)
    within ('#column_1') do
      click_link 'New Dish'
    end
    expect(page).to have_content 'New Dish'
    fill_in 'Name', with: 'DishBabou'
    click_button 'Create Dish'
    expect(current_path).to eq(chili_pepper.menu_section_path(section.menu, section))
    expect(page).to have_content('DishBabou')
  end

  scenario 'edit menu' do
    item = FactoryGirl.create(:chili_pepper_item, dish: dish, section: section, :column => 0)
    visit chili_pepper.menu_section_path(section.menu, section)
    expect(page).to have_selector('ul.column li#item_1')
    within 'ul.column li#item_1' do
      click_link 'Edit'
    end
    expect(page).to have_content("Edit #{dish.name}")
    fill_in 'Name', with: 'PoteDish Edited'
    click_button 'Update Dish'
    expect(current_path).to eq(chili_pepper.menu_section_path(menu, section))
    within 'ul.column li#item_1' do
      expect(page).to have_content('PoteDish Edited')
    end
  end

  scenario 'allows to delete dish' do
    item = FactoryGirl.create(:chili_pepper_item, dish: dish, section: section, :column => 0)
    visit chili_pepper.menu_section_path(menu, section)
    within 'ul.column li#item_1' do
      click_link 'Delete Dish'
    end
    expect(current_path).to eq(chili_pepper.menu_section_path(menu, section))
    expect(page).not_to have_selector('ul.column li#item_1')
  end

end
