class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  include EnumI18n
end
