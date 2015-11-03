class Support < ActiveRecord::Base

  validates :name, presence: true

  validates :email, presence: true


  def self.search(term)
    if term
      where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?",
              "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"])
    else
      Support.all
    end
  end


end
