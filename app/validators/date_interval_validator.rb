class DateIntervalValidator < ActiveModel::Validator

  def validate(record)
    if filled_dates?(record) && record.opening_date > record.ending_date
      record.errors[:ending_date] << "Must be after opening date."
    end
  end

  def filled_dates?(record)
    record.opening_date != nil && record.ending_date != nil
  end

end
