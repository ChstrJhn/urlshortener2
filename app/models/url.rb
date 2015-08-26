class Url < ActiveRecord::Base
  belongs_to :user
  
  validates_format_of :ori_url, :with => URI::regexp(%w(http https))

  before_save :create_short_url

  def create_short_url
    if self.short_url.nil?
    self.short_url = rand(435446..57683673).to_s(36)
    end
  end
end
