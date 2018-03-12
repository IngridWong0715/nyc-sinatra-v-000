class Landmark <ActiveRecord::Base
  belongs_to :figure

  def landmark_id
    "landmark_"+"#{self.id}"
  end
end
