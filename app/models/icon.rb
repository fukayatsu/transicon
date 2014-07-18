# Attributes:
# * id [integer, primary, not null] - primary key
# * category_id [integer] - TODO: document me
# * created_at [datetime] - creation time
# * image [string] - TODO: document me
# * updated_at [datetime] - last update time
class Icon < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :icon_sentences
  has_many :sentences, through: :icon_sentences
end
