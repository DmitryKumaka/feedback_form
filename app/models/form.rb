class Form < ActiveRecord::Base

  has_attached_file :attachment
  validates_attachment :attachment, size: { in: 0..2.megabytes },
                       content_type: { content_type: ["application/pdf", "application/msword",
                                      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] },
                       message: "Can't be large than 2 megabytes"
  validates_presence_of :name, :age
  validates :name, format: { with: /\A\s*[A-Z][a-z]+\s+[A-Z][a-z]+\s*\z/,
                             message: "Name should contain 2 words with large letter" }
  validates_numericality_of :age, greater_than_or_equal_to: 17,
                            less_than_or_equal_to: 65,
                            message: "Age should be from 17 to 65"
  validate :related_form_id, :related_id_should_be_saved

  def related_id_should_be_saved
    if related_form_id && !Form.exists?(related_form_id)
      errors.add(:related_form_id, "can't find form with #{related_form_id} ID")
    end
  end
end
