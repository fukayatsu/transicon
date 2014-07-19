# Attributes:
# * id [integer, primary, not null] - primary key
# * body_en [string] - TODO: document me
# * body_ja [string] - TODO: document me
# * created_at [datetime] - creation time
# * updated_at [datetime] - last update time
class Sentence < ActiveRecord::Base
  has_many :icon_sentences
  has_many :icons, through: :icon_sentences
end
