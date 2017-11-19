# document model
class Document < ApplicationRecord
  # Tells rails to use this uploader for this model.
  mount_uploader :attachment, AttachmentUploader
  # Make sure the owner's name is present.
  validates :name, presence: true
end
