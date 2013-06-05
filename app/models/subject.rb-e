class Subject < ActiveRecord::Base
  has_many :topics

  validates_presence_of :subject_name, :message => "Subject name is required"
  validates_presence_of :uuid, :message => "Subjects must have a UUID"
  validates_uniqueness_of :uuid, :message => "Subject UUIDs must be unique"
  validates_presence_of :download_code, :message => "Subjects must have a download code"
  validates_uniqueness_of :download_code, :message => "Subject download codes must be unique"
  
  after_initialize :init

  def as_json(options={ })
    super({ :include => { :topics => { :include => { :terms => {:except => [:id, :topic_id, :created_at, :updated_at]}}, :except => [:id, :subject_id, :created_at, :updated_at] } }, :except => [:id, :created_at, :updated_at] }.merge(options))
  end  

  private
    def init
      self.uuid ||= SecureRandom.uuid
      self.download_code ||= loop do
        random_token = SecureRandom.hex(3).to_s
        break random_token unless Subject.where(download_code: random_token).exists?
      end
      true
    end
end
