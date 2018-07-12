class Grade < ActiveRecord::Base
    belongs_to :stduent
    belongs_to :subject
end
