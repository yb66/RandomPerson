#!/usr/bin/env ruby -wKU
# coding: utf-8

module RandomPerson


  class SwedishFemaleFirst < Name
    
    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99)]
    end
     

    def setupnames
      @names = %w{ Abela Abluna Ada Adalheid Adela Adelaide Adelgund Adelheid Adelhild Adelina Adina Adla Adolfina Adriana Agata Agda Agnes Agneta Ajda Alba Alberta Albertina Aletta Alexandra Alfa Alfhild Alfhilda Alfrid Alfrida Ali Alice Alida Alma Amalia Amanda Amborg Amelia Amy Andrea Andrietta Angelika Angelina Angärd Anna Anne Annetta Annika Antoinetta Antonia Använt Apollonia Arina Armika Arna Arnborg Asgärd Assarina Asta Astrid Augusta Aurora Barbara Barbro Batseba Beata Beatrice Beda Belagt Benedikta Bengta Benjamina Bereta Bernhardina Berta Betty Betzy Birgitta Blanceflor Blanceflor, Blandina Blenda Boel Bolla Bothild Botil Botilda Botvi Brita Britta Brynhilda Börta Camilla Carola Cecilia Charlotta Constance Cornelia Dammö Daniel Den Desideria Diana Dina Dora Dordi Dorotea Ebba Ebbela Edborg Edborg, Edla Eida Eleonora Elin Elisabet Eljena Ella Ellena Ellika Elmira Elna Elsa Elvina Elvira Elzaby Emelia Emerentia Emfrid Emilia Emma Engel Engelborg Engla Enny Eriana Erika Ernestina Ester Estrid Eufemia Eufrosyna Eugenia Eva Evelina Ex Fanny Filippa Flora Florentina Franciska Fredrika Freja Frida Frigga Fronika Förekom Gabriella Geneta Georgina Gerborg Gerken Gertrud Gesa Geska Gisela Gloria Gottfrida Gottfrida, Greta Gudborg Gudlög Gudrun Gullborg Gunborg Gunhild Gunika Gunilla Gunnel Gunnur Guru Gustava Gustaviana Gya Gyrid Göle Gölig Gölin Görel Görvel Göta Götilda Hamfrid Hanna Harriet Hebbla Hedda Hedvig Helena Helga Helvig Hennes Henrietta Henrika Hilda Hildegard Hildur Hilla Hillegärd Hillevi Hilma Holmfrid Hornby Hulda Hustru Ida Idde Ide Iliana Ilja Inga Ingar Ingeborg Ingefrid Ingegärd Ingelöv Ingemo Inger Ingrid Irene Isabella Jakobina Jana Janna Jannika Jenny Johanna Jorid Josefina Judit Julia Juliana Justina Kajsa Karin Karna Karolina Katarina Kerstin Kerstina Kjella Kjellög Klara Konstantia Kornelia Kristensa Kristiana Kristina Laura Laurentia Laurina Lea Leila Lena Lina Linda Linnea Lisa Lisbet Lisbeta Lisette Lisken Liva Lotta Louise Lovisa Lucia Lukretia Lusse Lydia Magdalena Magnhild Maja Malena Malin Maren Margareta Margit Maria Mariana Marianne Marina Marit Marna Marta Martina Matilda Mektild Melchina Metta Mikaela Modéer Märet Märta Namnet Natalia Nilla Nora Oleana Olena Olga Olivia Olu Olöf Oskara Ottilia Ottiliana Patricia Paulina Pernilla Petronella Plantina Prisca Ragnborg Ragnfrid Ragnhild Rakel Ramborg Ramfrid Rangela Rebecka Regina Renata Rigmor Rikissa Risa Ronnug Rosa Rosina Rosita Runa Rut Rådgärd Sabina Sally Sanna Sara Se Seborg Selina Selma Serafia Serafina Sestrid Sibylla Signe Signild Sigrid Sina Sissa Sissela Skolastika Sofia Stina Sunniva Susanna Svea Svenborg Sönne Taga Tekla Teodora Teresia Tilla Tolla Tona Tora Torborg Tova Trina Truen Tullia Tyra Tyre Tören Ulla Ulrika Una Ursilla Ursula Valborg Vendela Veronika Vibeke Viktoria Vilhelmina Virginia Viveka Ärngunna Åleta Årsil Åsa Öborg Ödborg Ödgun Ödgärd Öllegård }
    end
 end 
end