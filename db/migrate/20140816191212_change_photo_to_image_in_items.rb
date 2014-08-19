class ChangePhotoToImageInItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
        t.rename :photo, :image 
    end
  end
end
