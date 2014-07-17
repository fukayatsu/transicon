# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * name [string]
# * position [integer, default=0, not null] - TODO: document me
# * updated_at [datetime] - last update time
class Category < ActiveRecord::Base
  scope :named, -> (name) { where(name: name) }
end
