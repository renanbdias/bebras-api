class UpdateDeputyService < BusinessProcess::Base
  needs :deputy

  needs :name
  needs :email
  needs :phone

  needs :school_name
  needs :school_phone
  needs :school_address
  needs :school_cep
  needs :school_city
  needs :school_state

  steps :update_deputy_and_school

  include ServiceExceptionHandler

  def call
    handle_exception do
      process_steps

      deputy
    end
  end

  private
    def update_deputy_and_school
      if name != nil
        deputy.name = name
      end

      if email != nil
        deputy.email = email
      end

      if phone != nil
        deputy.phone = phone
      end

      if school_name != nil
        deputy.school.name = school_name
      end

      if school_phone != nil
        deputy.school.phone = school_phone
      end

      if school_address != nil
        deputy.school.address = school_address
      end

      if school_cep != nil
        deputy.school.cep = school_cep
      end

      if school_city != nil
        deputy.school.city = school_city
      end

      if school_state != nil
        deputy.school.state = school_state
      end

      unless deputy.valid? && deputy.save
        fail("Failed to update deputy, errors: #{deputy.errors}")
      end
    end

end