require 'spec_helper'

feature 'Only Allows Admin to manage sections' do
  
 let(:menu) {FactoryGirl.create(:chili_pepper_menu)}
 let(:section) {FactoryGirl.create(:chili_pepper_section, :menu => menu)}

 scenario 'shoud not allow me to visit the new or edit pages without being an admin' do
   visit chili_pepper.new_menu_section_path(menu_id: menu.id)
   expect(page).not_to have_content('New Menu Section')
   visit chili_pepper.edit_menu_section_path(menu_id: menu.id, id: section.id)
   expect(page).not_to have_content('Edit')
 end

end

feature 'allows admins to manage sections' do

  let(:menu) {FactoryGirl.create(:chili_pepper_menu)}
  let(:section) {FactoryGirl.create(:chili_pepper_section, :menu => menu)}

  before :each do
    admin = FactoryGirl.create(:chili_pepper_admin)
    visit 'chili_pepper/admins/sign_in' 
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
  end

  scenario 'adds a section' do
   
    visit chili_pepper.new_menu_section_path(menu_id: menu.id)
    expect(page).to have_content 'New Menu Section'
    fill_in 'Name', with: 'SectionBabou'
    click_button 'Create Section'
    expect(current_path).to eq(chili_pepper.menu_section_path(menu, 'sectionbabou'))
    expect(page).to have_content('SectionBabou')
  end

  scenario 'edit menu' do
    visit chili_pepper.edit_menu_section_path(menu, section)
    expect(page).to have_content('Edit')
    fill_in 'Name', with: 'PoteSection Edited'
    click_button 'Update Section'
    expect(current_path).to eq(chili_pepper.menu_section_path(menu, section))
    expect(page).to have_content('PoteSection Edited')
  end

  scenario 'allows to delete menu' do
    visit chili_pepper.menu_section_path(menu, section)
    within("li#section_1") do
      click_link 'Delete Section'
    end
    expect(current_path).to eq(chili_pepper.menu_path(menu))
  end



# end

# feature 'Display Properly Menu' do
#   given(:menu) do
#     FactoryGirl.create(:menu)
#   end

#   scenario 'displays the proper menu' do
#     dish_1 = FactoryGirl.create(:dish, :column => 1, :menu_id => menu.id)
#     dish_2 = FactoryGirl.create(:dish, :column => 2, :menu_id => menu.id)
#     visit menu_path(menu)
#     page.should have_content menu.name
#     page.should have_selector('#column_1 #dish_#{dish_1.id}')
#     page.should have_selector('#column_2 #dish_#{dish_2.id}')

#   end

end
