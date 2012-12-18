class Page < ActiveRecord::Base
  validates_presence_of :body, :title
  validates_numericality_of :sort_order
end
