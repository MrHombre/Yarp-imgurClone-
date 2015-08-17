class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, presence: true

  auto_html_for :body do
      html_escape
      image
      youtube(:width => 400, :height => 250, :autoplay => true)
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end
end
