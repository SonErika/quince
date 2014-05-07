class AddAttachmentImageToDresses < ActiveRecord::Migration
  def change
    add_attachment :dresses, :image
  end
end
