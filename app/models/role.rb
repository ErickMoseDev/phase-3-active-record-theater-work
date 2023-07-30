class Role < ActiveRecord::Base
  has_many :auditions

  # returns an array of names from the actors associated with this role
  # output to be like ["Cilian Murphy","Walter White"]
  def actors
    self.auditions.map { |audition| audition.actor }
  end

  # returns an array of locations from the auditions associated with this role
  def locations
    self.auditions.map { |audition| audition.location }
  end

  # returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
  def lead
    auditions.find_by(hired: true) || "no actor has been hired for this role"
  end

  # returns the second instance of the audition that was hired for this role or returns a string 'no actor has been hired for understudy for this role'
  def understudy
    auditions.where(hired: true)[1] || "no actor has been hired for understudy for this role"
  end
end
