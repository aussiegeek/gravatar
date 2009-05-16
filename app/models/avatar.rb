class Avatar < ActiveRecord::Base
  validates_presence_of :email
#   validates_attachment_presence :avatar
  has_attached_file :avatar

  before_save :md5_email
  
  def to_param
    md5
  end
  
  private
  def md5_email
    self.md5 = Digest::MD5.hexdigest(email)
  end
end
