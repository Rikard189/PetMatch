class Pet < ApplicationRecord
    enum animal_type: [:dog, :cat]
end
