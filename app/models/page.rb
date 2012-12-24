class Page < ActiveRecord::Base
  before_validation :create_slug

  validates_presence_of :body, :title
  validates_numericality_of :sort_order

  def to_param
    self.slug
  end

  private
    def create_slug
      return unless self.title.present?
      self.slug ||= self.title.parameterize
    end
end
