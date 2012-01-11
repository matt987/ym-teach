class Alumno < ActiveRecord::Base
  belongs_to :maestra
  validates :documento, :uniqueness => {:message => 'Debe ser unico', :allow_blank => true},
                        :presence => {:message => 'Es requerido'}
  validates :nombre, :presence => {:message => 'Es requerido'}

  scope :limited, limit(10)
  scope :ordered, order('nombre asc')
  scope :nuevos, lambda{ limited
                         .ordered
                         .where(maestra_id: nil)
                       }
  scope :asignados, lambda{ |maestra| ordered
                                      .limited
                                      .where(maestra_id: maestra)            
                          }
end
