class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates :title, exclusion: { in: %w("True Facts") }
    validate :title_is_clickbait

    #Custom Validations
    def title_is_clickbait
        if title == "True Facts"
            errors.add(:title, "that title is prohibited")
        end
    end

end


# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction. This step requires an inclusion validator, which was not outlined in the lesson. You'll need to refer to the Rails guide to look up how to use it.