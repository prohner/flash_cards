class Topic < ActiveRecord::Base
  belongs_to :subject
  has_many :terms

  validates_presence_of :topic_name
  validates_presence_of :uuid
  validates_uniqueness_of :uuid
  
  after_initialize :init

  private
    def init
      self.uuid ||= SecureRandom.uuid
      true
    end
end
