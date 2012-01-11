class Maestra < ActiveRecord::Base
  has_many :alumnos
  has_many :materias
end
