# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * icon_id [integer] - TODO: document me
# * sentence_id [integer] - TODO: document me
# * updated_at [datetime] - last update time
class IconSentence < ActiveRecord::Base
  belongs_to :icon
  belongs_to :sentence
end
