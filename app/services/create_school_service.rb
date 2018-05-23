class CreateSchoolService < BusinessProcess::Base
  needs :school_params

  include ServiceExceptionHandler

  steps :check_params,
        :create_school

  def call
    handle_exception do
      process_steps

      @school
    end
  end

  private
    def check_params

      errors = []
      unless @name = school_params[:name]
        errors.append "Name can't be empty"
      end

      unless @phone = school_params[:phone]
        errors.append "Phone can't be empty"
      end

      unless @address = school_params[:address]
        errors.append "Address can't be empty"
      end

      unless @cep = school_params[:cep]
        errors.append "Cep can't be empty"
      end

      unless @city = school_params[:city]
        errors.append "City can't be empty"
      end

      unless @state = school_params[:state]
        errors.append "State can't be empty"
      end

      if !errors.empty?
        fail(errors.join(", "))
      end
    end

    def create_school
      unless @school = School.create(name: @name, phone: @phone, address: @address, cep: @cep, city: @city, state: @state)
        fail(@school.errors)
      end
    end
end
