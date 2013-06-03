class Term < ActiveRecord::Base
  belongs_to :topic

  validates_presence_of :question, :answer
  validates_presence_of :uuid
  validates_uniqueness_of :uuid

  after_initialize :init

  private
    def init
      self.uuid ||= SecureRandom.uuid
      true
    end
end
