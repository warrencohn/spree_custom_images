class AddImageUrl < ActiveRecord::Migration
  def change
    add_column :spree_custom_images, :small_url, :strng
    add_column :spree_custom_images, :medium_url, :string
    add_column :spree_custom_images, :large_url, :string

    reversible do |dir|
      dir.up do

        Spree::CustomImage.reset_column_information
        images = Spree::CustomImage.find(:all)

        images.each do |i|
          i.small_url = "images/" + i.name + i.format
          i.medium_url = "images/" + i.name + i.format
          i.large_url = "images/" + i.name + i.format
          i.save
        end
      end
    end
  end
end
