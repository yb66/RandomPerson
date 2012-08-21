# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class SpanishFemaleFirst < Name
      
      # @private            
      Names = %w{ Ababa Adela Adelaida Adelia Adelina Adriana África Alba Alejandra Alicia Alma Alondra Altagracia Amanda Amaya Amelia Amparo Ana Andrea Angélica Antonia Antonieta Araceli Ascensión Asunción Aurelia Aurora Azucena Aída Beatriz Belén Benita Berta Blanca Brunilda Bárbara Camila Caridad Carla Carlota Carmen Carolina Catalina Cecilia Celia Clara Claudia Clotilde Concepción Consolación Consuelo Cristina Cruz Daniela Dayana Delia Desamparados Diana Dionisia Dolores Dominga Dorotea Débora Elena Elisa Elvira Emilia Encarnación Enriqueta Ernestina Esperanza Estefanía Estela Ester Esther Eufemia Eugenia Eulalia Eva Fabiana Fabiola Felicidad Felipa Felisa Fernanda Filomena Flavia Flora Florencia Francisca Gabriela Gema Gloria Graciela Guadalupe Guillermina Hilda Hortensia Ilda Imelda Inmaculada Inés Irene Isabel Jacinta Joaquina Josefa Josefina Juana Julia Juliana Julieta Laura Lea Leonor Leticia Lidia Lilia Liliana Lorena Lorenza Lourdes Luciana Lucía Luisa Luna Luz Lía Magdalena Maite Manuela Marcela Marcelina Margarita Mariana Marina Marta Martina María María Jesús María José María Magdalena Matilde Mayte Mercedes Micaela Miguela Milagros Montserrat Mónica Narcisa Natalia Natividad Nieves Nilda Noelia Noemí Ofelia Olga Patricia Paula Paulette Paulina Paz Pilar Purificación Rafaela Ramona Raquel Rebeca Remedios Ricarda Rocío Rosa Rosalía Rosario Roxana Sandra Sara Selena Serafina Silvia Sofía Soledad Sonia Susana Tania Teodora Teresa Thiare Tiare Tomasa Trinidad Valentina Verónica Vicenta Victoria Virginia Yesenia  }

      def initialize
        @names = Names
        @formats = [ ->(n){ n.sample } ]
        @formats_ratiod = [ (0..99) ]

        super
      end
  
    end
  end
end   
