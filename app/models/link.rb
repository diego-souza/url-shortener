class Link < ActiveRecord::Base
  validates :long_url, presence: true, uniqueness: true
  validates_format_of :long_url, :with => /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*‌​)?/ix
  validates :code, presence: true
  before_validation :generate_code, on: :create
  before_validation :url_normalizer

  CODE_SIZE = 8

  def generate_code
    code = random_string(CODE_SIZE)
    while Link.where(code: code).any?
      code = random_string(CODE_SIZE)
    end
    self.code = code
  end

  def random_string(n)
    n.downto(1).map { |i| (65 + rand(25)).chr }.join
  end

  def url_normalizer
    self.long_url = "http://#{self.long_url}" unless self.long_url =~ /(http|https):\/\//ix
  end
end
