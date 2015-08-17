class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :image_url, :presence => true

  auto_html_for :image_url do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
