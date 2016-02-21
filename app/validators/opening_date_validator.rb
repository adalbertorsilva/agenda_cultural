class OpeningDateValidator < ActiveModel::Validator

  def validate(record)

    if record.opening_date != nil && record.opening_date < Date.today
      record.errors[:opening_date] << "Can't be before the current date"
    end

  end

end
