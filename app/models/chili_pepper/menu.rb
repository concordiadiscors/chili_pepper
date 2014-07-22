# == Schema Information
#
# Table name: chili_pepper_menus
#
#  id                            :integer          not null, primary key
#  name                          :string(255)
#  position                      :integer
#  description                   :string(255)
#  created_at                    :datetime
#  updated_at                    :datetime
#  slug                          :string(255)
#  menu_type                     :integer
#  availability                  :string(255)
#  price                         :decimal(5, 2)
#  published                     :boolean
#  downloadable_pdf_file_name    :string(255)
#  downloadable_pdf_content_type :string(255)
#  downloadable_pdf_file_size    :integer
#  downloadable_pdf_updated_at   :datetime
#  image_file_name               :string(255)
#  image_content_type            :string(255)
#  image_file_size               :integer
#  image_updated_at              :datetime
#

module ChiliPepper
  class Menu < ActiveRecord::Base
    validates_presence_of :name
    enum menu_type: [:food, :drinks]
    acts_as_list
    has_many :sections, class_name: 'ChiliPepper::Section', dependent: :destroy
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_attached_file :image,
                      styles: { medium: '1200x720>', thumb: '100x100>' },
                      default_url: '/images/:style/missing.png'
    has_attached_file :downloadable_pdf

    def self.published
      where published: true
    end

    def self.food_menus
      where menu_type: menu_types[:food]
    end

    def self.drinks_menus
      where menu_type: menu_types[:drinks]
    end

    def self.same_type_menus(menu_type)
      where(menu_type: menu_types[menu_type])
      .select('id, name, slug, position, menu_type, published')
      .order('position')
    end 
  end
end
