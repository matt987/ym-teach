class Materia < ActiveRecord::Base
  belongs_to :maestra
  validates :descripcion, :presence => {:message => 'Es requerido'}

  scope :limited, limit(10)
  scope :ordered, order('descripcion asc')
  scope :no_asignadas, lambda{ limited
                         .ordered
                         .where(maestra_id: nil)
                       }
  scope :asignadas, lambda{ |maestra| ordered
                                      .limited
                                      .where(maestra_id: maestra)            
                          }
end
