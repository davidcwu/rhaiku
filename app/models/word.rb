class Word < ActiveRecord::Base
  attr_accessible :syllables, :word

  validates :word, :uniqueness => true,
                   :format => /\A[a-zA-z]+\z/,
                   :presence => true

  validates :syllables, :presence => true,
                        :numericality => {
                          :greater_than => 0,
                          :less_than => 8
                        }

  def to_verbose_s
    "#{word} #{syllables}"
  end
end
