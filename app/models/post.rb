class Post < ActiveRecord::Base
    has_many :comments
    belongs_to :user 
    belongs_to :category

    validates :title, :content, presence: true

    scope :find_post, ->(title) {where("(title) == ?", title)}
    scope :max_content, ->(length) {where("LENGTH(content) > ?", length)}
    scope :top_post, -> {joins(:comments).where(comments: {id: 2})}
    # Company.joins(:jobs).group("jobs.company_id").order("count(jobs.company_id) desc")
    scope :post_comments, -> {joins(:comments).group(:id).order('COUNT(comments.id) DESC').limit(1)}


end
