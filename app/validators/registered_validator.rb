class RegisteredValidator < ActiveModel::Validator
  
  def validate(record)
    if !record.registered
      if !record.password.present?

        record.errors[:password] = "must be changed for a new user."
      else
        record.registered = true
      end
    end
  end

end

