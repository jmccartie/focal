class Post < ActiveRecord::Base
  validates_presence_of :title, :body

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
