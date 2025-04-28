class Post < ApplicationRecord
  before_create :set_uuid7
  before_save :set_published_date
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :body, presence: true

  def published_status
    if is_published? && published_date.present?
      "Published #{published_date.strftime('%B %-d, %Y')}"
    else
      "Draft"
    end
  end

  private

  def set_uuid7
    self.id = Random.uuid_v7 if id.nil?
  end

  def set_published_date
    if is_published? && published_date.nil?
      self.published_date = Time.current
    end
  end
end
