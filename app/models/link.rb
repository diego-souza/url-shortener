class Link < ActiveRecord::Base
  validates :long_url, presence: true, uniqueness: true
  validates :code, presence: true
  before_validation :generate_code, on: :create

  def generate_code
    code = random_string(8)
    while Link.where(code: code).any?
      code = random_string(8)
    end
    self.code = code
  end

  def random_string(n)
    string = ""
    n.times{ string << (65 + rand(25)).chr }
    string
  end

end
