class Subject < ActiveRecord::Base
  has_many :topics

  validates_presence_of :subject_name
  validates_presence_of :uuid
  validates_uniqueness_of :uuid
  
  after_initialize :init

  private
    def init
      self.uuid ||= SecureRandom.uuid
      true
    end
end
