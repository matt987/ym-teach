class Alumno < ActiveRecord::Base
  belongs_to :maestra
  validates :documento, :uniqueness => {:message => 'Debe ser unico', :allow_blank => true},
                        :presence => {:message => 'Es requerido'}
  validates :nombre, :presence => {:message => 'Es requerido'}
  scope :nuevos, where( maestra_id: nil)
  scope :ordered, order('nombre asc')
  scope :asignados, lambda{ |maestra| ordered
                                      .where(maestra_id: maestra)
  }
end
