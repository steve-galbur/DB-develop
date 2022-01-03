class Status < ActiveRecord::Base
    has_many :appointments

    scope :active, ->{ where(active: true) }
    scope :inactive, ->{ where(active: false) }
end