module SaneBudget
  module Views
    module Parts
      class Account < SaneBudget::Views::Part
        def abstract
          "This account has #{id} as primary key, #{status_id} as status id and #{email} as email."
        end
      end
    end
  end
end
