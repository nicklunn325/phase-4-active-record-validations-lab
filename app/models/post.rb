class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

    # def clickbait
    #     if title
    #         strings = ["Won't Believe", "Secret", "Top", "Guess"] # array of strings we want the title to contain at least one of

    #         # iterating over array of strings & returning a new array that includes any strings that were strictly equal to the title
    #         title_check = strings.select do |string| 
    #             title.include?(string)
    #         end
    #         if title_check.empty?
    #             errors.add(:title, "must be sufficiently clickbaity")
    #         end
    #     end
    # end
end
