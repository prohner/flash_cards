class Topic < ActiveRecord::Base
  belongs_to :subject
  has_many :terms

  validates_presence_of :topic_name, :message => "Must have a topic name"
  validates_presence_of :uuid, :message => "Must have a UUID"
  validates_uniqueness_of :uuid, :message => "UUIDs must be unique"
  validates_presence_of :download_code, :message => "Must have a download code"
  validates_uniqueness_of :download_code, :message => "Download code must be unique"
  
  after_initialize :init

  private
    def init
      self.uuid ||= SecureRandom.uuid
      self.download_code ||= loop do
        random_token = SecureRandom.hex(3)
        break random_token unless Subject.where(download_code: random_token).exists?
      end
      true
    end
end
