class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader
  belongs_to :pet
end
