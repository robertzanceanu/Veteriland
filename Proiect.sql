DROP TABLE useri CASCADE CONSTRAINTS
/
CREATE TABLE useri(
      id INT NOT NULL PRIMARY KEY,
      email VARCHAR2(60) NOT NULL,
      password VARCHAR2(30) NOT NULL,
      doctor NUMBER(1) NOT NULL,
      stapan NUMBER(1) NOT NULL
)
/
DROP TABLE doctori CASCADE CONSTRAINTS
/
CREATE TABLE doctori(
      id INT NOT NULL PRIMARY KEY,
      nume VARCHAR2(15) NOT NULL,
      prenume VARCHAR2(30) NOT NULL,
      varsta NUMBER(2) NOT NULL,
      email VARCHAR2(60) NOT NULL,
      numar_telefon VARCHAR2(10) NOT NULL
)
/
DROP TABLE doctoriuseri CASCADE CONSTRAINTS
/
CREATE TABLE doctoriuseri(
    id INT NOT NULL PRIMARY KEY,
    id_user INT NOT NULL,
    id_doctor INT NOT NULL,
    CONSTRAINT fk_doctoriuseri_id_user FOREIGN KEY (id_user) REFERENCES useri(id),
    CONSTRAINT fk_doctoriuseri_id_doctor FOREIGN KEY (id_doctor) REFERENCES doctori(id)
    )
/
SET SERVEROUTPUT ON;
DECLARE
    TYPE varr is VARRAY(1000) OF VARCHAR2(255);
    lista_nume varr := varr('Alboaie','Ababei','Adamache','Aioane','Alamaie','Alb','Amarghioalei','Apetrei','Ardel','Avasalcei','Baba','Bac','Bacovia','Bicut','Bej','Bejan','Bomba','Bubuila','Buc','Caba','Ceaca','Cerb','Chirila','Chisalita','Ciuciu','Ciuhu','Cubanit','Cucu','Cucila','Daban','Damb','Deac','Dia','Diaconu','Divan','Dascalu','Divis','Dezi','Devesel','Eacobescu','Ebu','Edelceanu','Efrim','Eftode','Emag','Enache','Epurescu','Eufrosie','Eva','Fabricantu','Fachir','Fagaras','Fier','Filat','Feldes','Fraier','Fuca','Fulger','Frasin','Galati','Geaca','Gheara','Gheata','Geaman','Geamanu','Gheorghita','Gherca','Ghergheloaia','Ghergheluca','Haba','Hada','Habuc','Hedea','Hedeus','Heia','Helici','Hert','Hertug','Hritac','Iacata','Iaciu','Ibanescu','Ichim','Idiceanu','Iefta','Ilian','Inurean','Ioia','Ioje','Jaba','Jac','Jacatoa','Jbanca','Jdeica','Jder','Jdirea','Jian','Jneapan','Joaca-bine','Joaca-rau','Keseru','Kilcos','Kiriac','Kilogram','Kogalniceanu','Komlosi','Kosat','Kovaci','Kretulescu','Kirita','Labici','Laciu','Lacrima','Lae','Lambeanu','Leac','Lia','Lezeu','Lezeriuc','Levoi','Mac','Macafei','Mandra','Meca','Mecher','Marina','Meciu','Meci','Mecu','Mache','Naca','Nace','Nana','Neab','Neag','Neagoie','Nica','Nichie','Neagu','Nicolau','Oaca','Oae','Oaida','Oana','Oala','Oceanu','Oda','Odageriu','Odea','Odgon','Paca','Pacala','Paciu','Pacurari','Peagu','Pechea','Pechi','Pecheanu','Pechis','Pechiu','Rababoc','Rabei','Rac','Raca','Racle','Reaboi','Rebedea','Rebega','Rebej','Rebic','Rotaru','Saba','Sarpe','Sbanza','Sbarn','Scacioc','Sdobis','Sdrobici','Seba','Sebastian','Serban','Tabac','Tabachiu','Tabara','Tcaci','Teaca','Teban','Tecaciuc','Tecar','Tecariu','Tecareu','Uancea','Uca','Ucean','Udangiu','Uhaci','Uglea','Ugrutan','Udila','Udrea','Udovita','Vacea','Vasile','Vac','Vajea','Vlad','Valcu','Valvoi','Vana','Vedea','Valvoi','Zabarceanu','Zabos','Zahan','Zanceanu','Zaiceanu','Zaicean','Zah','Zdruncit','Zara','Zbant');
    lista_prenume_fete varr := varr('Alexandra', 'Andreea', 'Alina', 'Adina', 'Antonela', 'Alexia', 'Ana', 'Anabela', 'Adriana', 'Ariana', 'Anca', 'Anisoara', 'Bianca', 'Beatrice', 'Bogdana', 'Brandusa', 'Betina', 'Cosmina', 'Claudia', 'Crina', 'Camelia', 'Corina', 'Carmen', 'Codruta', 'Codrina', 'Catrina', 'Clara', 'Clarisa', 'Casandra', 'Cecilia', 'Daria', 'Dana', 'Daniela', 'Denisa', 'Diana', 'Daiana', 'Dora', 'Dorina', 'Dalila', 'Daciana', 'Elena', 'Eugenia', 'Ecaterina', 'Elodia', 'Emilia', 'Evelina', 'Eliza', 'Florina', 'Flavia', 'Fiona', 'Florentina', 'Filofteia', 'Francesca', 'Gabriela', 'Georgiana', 'Gina', 'Gratiela', 'Georgia', 'Hortensia', 'Irina', 'Iulia', 'Iolanda', 'Ionela', 'Ivona', 'Iuliana', 'Julieta', 'Julia', 'Janeta', 'Jana', 'Letitia', 'Liliana', 'Laura', 'Luciana', 'Lucretia', 'Manuela', 'Maria', 'Mariuca', 'Maricica', 'Mirela', 'Monica', 'Marta', 'Malina', 'Narcisa', 'Nadia', 'Nicoleta', 'Nora', 'Natalia', 'Otilia', 'Oana', 'Olivia', 'Olga', 'Olimpia', 'Paraschiva', 'Paula', 'Patricia', 'Petronela', 'Pamela', 'Rodica', 'Ramona', 'Raluca', 'Rebeca', 'Roxana', 'Sofia', 'Sabina', 'Simona', 'Sorina', 'Sonia', 'Stela', 'Tamara', 'Teodora', 'Tania', 'Teona', 'Valentina', 'Veronica', 'Vanesa', 'Viviana', 'Valeria');
    lista_prenume_baieti varr := varr('Angel', 'Andrei', 'Augustin', 'Antonio', 'Aurel','Alin', 'Adelin', 'Adelin', 'Bogdan', 'Cornel', 'Catalin', 'Claudiu', 'Cezar', 'Constantin', 'Ciprian', 'Costel', 'Dan', 'Daniel', 'Dorian', 'Dorel', 'Denis', 'Doru', 'Eugen', 'Emil', 'Eric', 'Eusebiu', 'Eduard', 'Fabian', 'Florin', 'Flavius', 'Felix', 'Filip', 'Gabi', 'Gabriel', 'Ghita', 'Giga', 'George', 'Gianu', 'Horia', 'Horatiu', 'Iacob', 'Ionel', 'Ion', 'Iulian', 'Iustin', 'Ivan', 'Irinel', 'Ilie', 'Laur', 'Lucian', 'Lucretiu', 'Licentiu', 'Lazar', 'Laurentiu', 'Marcel', 'Mihai', 'Mitica', 'Marcu', 'Mircea', 'Madalin', 'Maximilian', 'Nae', 'Nelu', 'Nicu', 'Nicolae', 'Narcis', 'Nechifor', 'Nicusor', 'Norman', 'Octavian', 'Octavius', 'Otello', 'Oliviu', 'Ovidiu', 'Octav', 'Paul', 'Petru', 'Petrica', 'Pavel', 'Radu', 'Remus', 'Rares', 'Razvan', 'Raul', 'Relu', 'Sorin', 'Simon', 'Sabin', 'Sandu', 'Sergiu', 'Silviu', 'Teodor', 'Tudor', 'Traian', 'Toma', 'Tiberiu', 'Valeriu', 'Vicentiu', 'Valentin', 'Vlad', 'Viorel', 'Vasile');
    
    v_nume VARCHAR2(255);
    v_prenume VARCHAR2(255);
    v_email VARCHAR2(255);
    v_varsta NUMBER(2);
    v_telefon VARCHAR2(10);
    v_cifra NUMBER(1);
    v_stapan INT;
    v_doctor INT;
    v_password VARCHAR2(255);
begin
    DBMS_OUTPUT.PUT_LINE('Inserarea doctori in tabela useri');
    DBMS_OUTPUT.PUT_LINE('Inserarea doctori in tabela tabela doctori');
    DBMS_OUTPUT.PUT_LINE('Creare legatura doctori-useri in tabela doctoriuseri');
    FOR v_i in 1..100 LOOP
        v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
        IF(DBMS_RANDOM.VALUE(0,100)<50) THEN
            v_prenume := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
        ELSE
            v_prenume := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
        END IF;
        v_email := lower(v_nume || '.' || v_prenume||to_char(v_i)||'@gmail.com');
        v_varsta := TRUNC(DBMS_RANDOM.VALUE(25,65));
        v_telefon :='07';
        for  v_tlf in 1..8 loop
          v_cifra := TRUNC(DBMS_RANDOM.VALUE(0,9));
          v_telefon := concat(v_telefon,to_char(v_cifra));
        end loop;
        v_password := DBMS_RANDOM.STRING('a',10);
        v_doctor := 1;
        v_stapan := 0;
        insert into useri values(v_i,v_email,v_password,v_doctor,v_stapan);
        insert into doctori values(v_i,v_nume,v_prenume,v_varsta,v_email,v_telefon);
        insert into doctoriuseri values (v_i,v_i,v_i);   
    end loop;
end;
/
DROP TABLE tip_animal CASCADE CONSTRAINTS
/
CREATE TABLE tip_animal (
  id INT NOT NULL PRIMARY KEY,
  tip_animal VARCHAR2(30)
)
/
SET SERVEROTPUT ON
DECLARE
    TYPE varr is VARRAY(1000) OF VARCHAR2(255);
    lista_tip_animal varr := varr('Caine', 'Pisica', 'Hamster', 'Perus', 'Papagal', 'Porumbel', 'Soparla');
    v_nume VARCHAR2(255);
begin
    DBMS_OUTPUT.PUT_LINE('Inserare tipuri animale');
    FOR v_i in 1..lista_tip_animal.count LOOP
      v_nume := lista_tip_animal(v_i);
      insert into tip_animal values(v_i, v_nume);
    END LOOP;
end;
/
DROP TABLE specializare CASCADE CONSTRAINTS
/
CREATE TABLE specializare (
    id INT NOT NULL PRIMARY KEY,
    id_doctor INT NOT NULL,
    id_animal INT NOT NULL,
    CONSTRAINT fk_specializare_id_doctor FOREIGN KEY (id_doctor) REFERENCES doctori(id),
    CONSTRAINT fk_specializare_id_animal FOREIGN KEY (id_animal) REFERENCES tip_animal(id)
)
/
SET SERVEROUTPUT ON;
DECLARE
    v_animal_tip_count INT;
    v_doctori_count INT;
    v_animal_tip INT;
    v_id_doctor INT;
begin
    DBMS_OUTPUT.PUT_LINE('Inserare specializari pentru fiecare doctor');
    select count(*) into v_doctori_count from doctori;
    select count(*) into v_animal_tip_count from tip_animal;
    FOR v_i in 1..v_doctori_count loop
      v_animal_tip := TRUNC(DBMS_RANDOM.VALUE(0,v_animal_tip_count))+1;
      insert into specializare values (v_i,v_i,v_animal_tip);
    end loop;
end;
/
DROP TABLE stapani CASCADE CONSTRAINTS
/
CREATE TABLE stapani(
    id INT NOT NULL PRIMARY KEY,
    nume VARCHAR2(15) NOT NULL,
    prenume VARCHAR2(30) NOT NULL,
    varsta NUMBER(2) NOT NULL,
    email VARCHAR2(60) NOT NULL,
    numar_telefon NUMBER(10) NOT NULL
)
/
DROP TABLE stapaniuseri CASCADE CONSTRAINTS
/
CREATE TABLE stapaniuseri(
    id INT NOT NULL PRIMARY KEY,
    id_user INT NOT NULL,
    id_stapan INT NOT NULL,
    CONSTRAINT fk_stapaniuseri_id_user FOREIGN KEY (id_user) REFERENCES useri(id),
    CONSTRAINT fk_stapaniuseri_id_stapan FOREIGN KEY (id_stapan) REFERENCES stapani(id)
)
/
SET SERVEROUTPUT ON;
DECLARE
    TYPE varr is VARRAY(1000) OF VARCHAR2(255);
    lista_nume_stapani varr := varr('Albul','Acasandrei','Adamache','Aioane','Alamaie','Albut','Amar','Apetrei','Ardeleanu','Aval','Andrei','Alexandrescu','Barbut','Baciu','Bacovia','Biscuite','Bej','Bejan','Barbu','Bubuila','Bucur','Bulboaca','Caban','Ceacar','Cerbul','Chiriloi','Chisalita','Ciuciu','Ciuhu','Ciuhodaru','Curaj','Cucila','Cristi','Dabani','Damb','Deacu','Dia','Dior','Diac','Divin','Dascalitu','Dir','Dezi','Denoapte','Devesel','Eacobescu','Ebui','Edelcean','Efrim','Eftodi','Emagro','Enachescu','Epurescu','Eufrosie','Eva','Fabricant','Fachirul','Fagarasi','Fierar','Filat','Feldesi','Fraierul','Fucas','Fulger','Frasinaru','Galati','Gecoaica','Gheara','Ghetar','Geamanu','Geamanul','Gheorghita','Gherca','Ghergheloaia','Ghergheluca','Haba','Hada','Habuc','Hedea','Hedeus','Heia','Helici','Hert','Hertug','Hritac','Iacata','Iac','Ibanescu','Ichim','Idiceanu','Iefta','Iulian','In','Ioia','Ioje','Jaba','Jaca','Jacota','Jbanca','Jdeica','Jder','Jdirea','Jianul','Jneapan','Joaca-bine','Joaca-rau','Keseru','Kilcos','Kiriac','Kilogram','Kogalniceanu','Komlosi','Kosat','Kovaci','Kretulescu','Kirita','Kalciu','Labician','Laciur','Lacrima','Laes','Lambeanu','Leacul','Lia','Lezeu','Lerege','Lezeriuc','Leizeriuc','Levoia','Mac','Macdonalds','Macafei','Mandria','Meca','Mecer','Marina','Meciu','Mecib','Melcu','Mache','Mariniuc','Nacal','Nace','Nana','Neabi','Neagoie','Neagoi','Nicar','Nichie','Neagu','Nicolau','Nicoara','Oaca','Oae','Oaida','Oana','Oala','Oceanu','Oda','Odageriu','Odea','Odgon','Paca','Pacanea','Pacala','Paciu','Pacurari','Peagu','Pechea','Pechi','Pecheanu','Pechi','Pechiul','Rababoc','Rabei','Rac','Raca','Racla','Reaboi','Rebedea','Rebega','Rebej','Rebic','Rotaru','Saba','Sarpe','Sbanza','Sbarn','Scacioc','Sdobis','Sdrobici','Seba','Sebastian','Serban','Sanie','Seara','Tabac','Tiganasu','Tabachie','Tabara','Tabaracea','Taci','Teaca','Teban','Tecaciuc','Tecar','Tecariu','Tecaritu','Tecareu','Uancea','Uca','Ucean','Udangiu','Uhaci','Uglea','Ugrutan','Udila','Udrea','Udovita','Vacea','Vasile','Vac','Vajea','Vlad','Valcu','Valvoi','Vana','Vedea','Valvoi','Zabarceanu','Zabos','Zahan','Zanceanu','Zaiceanu','Zaicean','Zah','Zdruncit','Zara','Zbant');
    lista_prenume_fete varr := varr('Alexandra', 'Andreea', 'Alina', 'Adina', 'Antonela', 'Alexia', 'Ana', 'Anabela', 'Adriana', 'Ariana', 'Anca', 'Anisoara', 'Bianca', 'Beatrice', 'Bogdana', 'Brandusa', 'Betina', 'Cosmina', 'Claudia', 'Crina', 'Camelia', 'Corina', 'Carmen', 'Codruta', 'Codrina', 'Catrina', 'Clara', 'Clarisa', 'Casandra', 'Cecilia', 'Daria', 'Dana', 'Daniela', 'Denisa', 'Diana', 'Daiana', 'Dora', 'Dorina', 'Dalila', 'Daciana', 'Elena', 'Eugenia', 'Ecaterina', 'Elodia', 'Emilia', 'Evelina', 'Eliza', 'Florina', 'Flavia', 'Fiona', 'Florentina', 'Filofteia', 'Francesca', 'Gabriela', 'Georgiana', 'Gina', 'Gratiela', 'Georgia', 'Hortensia', 'Irina', 'Iulia', 'Iolanda', 'Ionela', 'Ivona', 'Iuliana', 'Julieta', 'Julia', 'Janeta', 'Jana', 'Letitia', 'Liliana', 'Laura', 'Luciana', 'Lucretia', 'Manuela', 'Maria', 'Mariuca', 'Maricica', 'Mirela', 'Monica', 'Marta', 'Malina', 'Narcisa', 'Nadia', 'Nicoleta', 'Nora', 'Natalia', 'Otilia', 'Oana', 'Olivia', 'Olga', 'Olimpia', 'Paraschiva', 'Paula', 'Patricia', 'Petronela', 'Pamela', 'Rodica', 'Ramona', 'Raluca', 'Rebeca', 'Roxana', 'Sofia', 'Sabina', 'Simona', 'Sorina', 'Sonia', 'Stela', 'Tamara', 'Teodora', 'Tania', 'Teona', 'Valentina', 'Veronica', 'Vanesa', 'Viviana', 'Valeria');
    lista_prenume_baieti varr := varr('Angel', 'Andrei', 'Augustin', 'Antonio', 'Aurel','Alin', 'Adelin', 'Adelin', 'Bogdan', 'Cornel', 'Catalin', 'Claudiu', 'Cezar', 'Constantin', 'Ciprian', 'Costel', 'Dan', 'Daniel', 'Dorian', 'Dorel', 'Denis', 'Doru', 'Eugen', 'Emil', 'Eric', 'Eusebiu', 'Eduard', 'Fabian', 'Florin', 'Flavius', 'Felix', 'Filip', 'Gabi', 'Gabriel', 'Ghita', 'Giga', 'George', 'Gianu', 'Horia', 'Horatiu', 'Iacob', 'Ionel', 'Ion', 'Iulian', 'Iustin', 'Ivan', 'Irinel', 'Ilie', 'Laur', 'Lucian', 'Lucretiu', 'Licentiu', 'Lazar', 'Laurentiu', 'Marcel', 'Mihai', 'Mitica', 'Marcu', 'Mircea', 'Madalin', 'Maximilian', 'Nae', 'Nelu', 'Nicu', 'Nicolae', 'Narcis', 'Nechifor', 'Nicusor', 'Norman', 'Octavian', 'Octavius', 'Otello', 'Oliviu', 'Ovidiu', 'Octav', 'Paul', 'Petru', 'Petrica', 'Pavel', 'Radu', 'Remus', 'Rares', 'Razvan', 'Raul', 'Relu', 'Sorin', 'Simon', 'Sabin', 'Sandu', 'Sergiu', 'Silviu', 'Teodor', 'Tudor', 'Traian', 'Toma', 'Tiberiu', 'Valeriu', 'Vicentiu', 'Valentin', 'Vlad', 'Viorel', 'Vasile');
    
    v_nume VARCHAR2(255);
    v_prenume VARCHAR2(255);
    v_email VARCHAR2(255);
    v_varsta NUMBER(2);
    v_telefon VARCHAR2(10);
    v_cifra NUMBER(1);
    v_stapan INT;
    v_doctor INT;
    v_password VARCHAR2(255);
    v_user_nr INT;
    v_i_user INT;
begin
    DBMS_OUTPUT.PUT_LINE('Inserare stapani');
    select count(*) into v_user_nr from useri;
    FOR v_i in 1..100 LOOP
        v_nume := lista_nume_stapani(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume_stapani.count))+1);
        IF(DBMS_RANDOM.VALUE(0,100)<50) THEN
            v_prenume := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
        ELSE
            v_prenume := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
        END IF;
        v_email := lower(v_nume || '.' || v_prenume||to_char(v_i)||'@gmail.com');
        v_varsta := TRUNC(DBMS_RANDOM.VALUE(18,90));
        v_telefon := '07';
        for  v_tlf in 1..8 loop
          v_cifra := TRUNC(DBMS_RANDOM.VALUE(0,9));
          v_telefon := concat(v_telefon,to_char(v_cifra));
        end loop;
        v_password := DBMS_RANDOM.STRING('a',10);
        v_doctor := 0;
        v_stapan := 1;
        v_i_user := v_user_nr+v_i;
        insert into useri values(v_i_user,v_email,v_password,v_doctor,v_stapan);
        insert into stapani values(v_i,v_nume,v_prenume,v_varsta,v_email,v_telefon);
        insert into stapaniuseri values (v_i,v_i_user,v_i);
    end loop;
end;
/
DROP TABLE pacienti CASCADE CONSTRAINTS
/
CREATE TABLE pacienti (
    id INT NOT NULL PRIMARY KEY,
    nume VARCHAR2(10),
    varsta VARCHAR2(2),
    tip_animal VARCHAR2(30)
)
/
DROP TABLE pacient_stapan CASCADE CONSTRAINTS
/
CREATE TABLE pacient_stapan (
    id INT NOT NULL PRIMARY KEY,
    id_pacient INT NOT NULL,
    id_stapan INT NOT NULL,
    CONSTRAINT fk_pacient_stapan_id_pacient FOREIGN KEY (id_pacient) REFERENCES pacienti(id),
    CONSTRAINT fk_pacient_stapan_id_stapan FOREIGN KEY (id_stapan) REFERENCES stapani(id)
)
/
SET SERVEROUTPUT ON;
DECLARE
    TYPE varr IS VARRAY(1000) OF VARCHAR2(255);
    lista_tip_animal varr := varr('Caine', 'Pisica', 'Hamster', 'Perus', 'Papagal', 'Porumbel', 'Soparla');
    lista_nume_animale varr := varr('Aricioi', 'Andinel', 'Alintatel', 'Arnor', 'Andy', 'Aricel', 'Biju', 'Birix', 'Boto', 'Botosel', 'Bidu', 'Bulinel', 'Bujorel', 'Batranel', 'Babinco', 'Bobi', 'Bobita', 'Balonel', 'Cocolico', 'Cocorico', 'Celi', 'Ciupitel', 'Cici', 'Ciorchinel', 'Ciripel', 'Delfi', 'Didi', 'Dino', 'Durduliul', 'Delfinel', 'Dulcica', 'Elefantel', 'Ely', 'Electricel', 'Edutu', 'Elinel', 'Fifi', 'Flocosel', 'Floricel', 'Flaffy', 'Fifo', 'Fidi', 'Gargarel', 'Giginel', 'Gogonel', 'Grivei', 'Gridi', 'Golanel', 'Iepurila', 'Irinel', 'Jujulici', 'Jijinel', 'Licurici', 'Lili', 'Lolo', 'Lila', 'Lolita', 'Libi', 'Mititel', 'Miri', 'Micinel', 'Mormaila', 'Nini', 'Nana', 'Nano', 'Norman', 'Odonel', 'Piti', 'Piticu', 'Prichindel', 'Puiutu', 'Petru', 'Pablo', 'Rori', 'Rex', 'Rexo', 'Richi', 'Sisu', 'Sisi', 'Sandi', 'Titi', 'Tomita', 'Tomi', 'Timi', 'Vivi', 'Vini', 'Volvo', 'Zurli', 'Zapacila', 'Zizina', 'Zizinel');

    v_nume VARCHAR2(255);
    v_varsta NUMBER(2);
    v_tip_animal VARCHAR2(255);
    v_nr_stapani INT;
    v_id_stapan INT;
begin
    DBMS_OUTPUT.PUT_LINE('Inserare pacienti');
    select count(*) into v_nr_stapani from stapani;
    FOR v_i in 1..100 loop
        v_nume := lista_nume_animale(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume_animale.count))+1);
        v_varsta := TRUNC(DBMS_RANDOM.VALUE(0,20));
        v_id_stapan := TRUNC(DBMS_RANDOM.VALUE(1,v_nr_stapani));
        v_tip_animal := lista_tip_animal(TRUNC(DBMS_RANDOM.VALUE(0,lista_tip_animal.count))+1);

        insert into pacienti values(v_i,v_nume,v_varsta,v_tip_animal);
        insert into pacient_stapan values(v_i,v_i,v_id_stapan);
    end loop;
end;
/
DROP TABLE programari CASCADE CONSTRAINTS
/
CREATE TABLE programari (
    id INT NOT NULL PRIMARY KEY,
    id_doctor INT NOT NULL,
    id_pacient INT NOT NULL,
    data DATE NOT NULL,
    ora VARCHAR2(255) NOT NULL,
    motiv VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_programari_id_doctor FOREIGN KEY (id_doctor) REFERENCES doctori(id),
    CONSTRAINT fk_programari_id_pacient FOREIGN KEY (id_pacient) REFERENCES pacienti(id)
)
/
SET SERVEROUTPUT ON;
DECLARE
    TYPE varr IS VARRAY(1000) OF VARCHAR2(255);
    lista_motiv_programare varr := varr('Consultatie periodica', 'Consultatii dermatologice', 'Consultatii chirurgicale', 'Consiliere nutritionala', 'Microciparea si Carnetul de sanatate', 'Pasaportul', 'Vaccinarea antirabica', 'Vaccinarea polivalenta', 'Vaccinarea Monovalenta', 'Stomatologie', 'Oftalmologie', 'Analize de laborator');
    
    v_nr_doctori INT;
    v_nr_pacienti INT;
    v_id_doctor INT;
    v_id_pacient INT;
    v_data_programare DATE;
    v_ora VARCHAR2(10);
    v_motiv VARCHAR2(255);
begin
    DBMS_OUTPUT.PUT_LINE('Inserare programari');
    select count(*) into v_nr_doctori from doctori;
    select count(*) into v_nr_pacienti from pacienti;
    FOR v_i in 1..100 loop
        v_id_pacient := TRUNC(DBMS_RANDOM.value(0, v_nr_pacienti))+1;
        v_id_doctor := TRUNC(DBMS_RANDOM.value(0, v_nr_doctori))+1;
        v_data_programare := (sysdate + TRUNC(DBMS_RANDOM.VALUE(0,250)));
        v_ora := concat(TRUNC(to_char(DBMS_RANDOM.VALUE(10,17))),':00');
        v_motiv := lista_motiv_programare(TRUNC(DBMS_RANDOM.VALUE(0,lista_motiv_programare.count))+1);
        insert into programari values (v_i,v_id_doctor,v_id_pacient,v_data_programare,v_ora,v_motiv); 
    end loop;
end;
/
DROP TABLE tratamente CASCADE CONSTRAINTS
/
CREATE TABLE tratamente (
    id INT NOT NULL PRIMARY KEY,
    motiv VARCHAR2(255) NOT NULL,
    medicatie VARCHAR2(255) NOT NULL,
    tip_animal VARCHAR2(255) NOT NULL
)
/
DROP SEQUENCE tratamente_sequence;
/
CREATE SEQUENCE tratamente_sequence;
/
CREATE OR REPLACE TRIGGER tratamente_on_insert
  BEFORE INSERT ON tratamente
  FOR EACH ROW
BEGIN
  SELECT tratamente_sequence.nextval
  INTO :new.id
  FROM dual;
END;

/
SET SERVEROUTPUT ON;
DECLARE
    TYPE varr IS VARRAY(1000) OF VARCHAR2(255);
    lista_tip_animal varr := varr('Caine', 'Pisica', 'Hamster', 'Perus', 'Papagal', 'Porumbel', 'Soparla');
    lista_motiv_programare varr := varr('Consultatie periodica', 'Consultatii dermatologice', 'Consultatii chirurgicale', 'Consiliere nutritionala', 'Microciparea si Carnetul de sanatate', 'Pasaportul', 'Vaccinarea antirabica', 'Vaccinarea polivalenta', 'Vaccinarea Monovalenta', 'Stomatologie', 'Oftalmologie', 'Analize de laborator');
    lista_medicatie_caini varr := varr('Beaphar Zgarda Bio Caine', 'Vitaderm solutie orala 200 ml', 'Petnil 70 tablete', 'Sampon Pyoderm Glyco, 200 ml', 'Dermoscent Cicafolia Caine/Pisica 30ml', 'Vitavet Complex 60 tablete', 'Sanal Cat-Dog Relax 15 tablete', 'TRICALD 3 x30 Comprimate', 'Solutie injectabil? MULTIVITAROM 50 ml', 'Aptus Reconvalescent Dog Vet Pasta 100 g', 'Dentivet Total 125ml', 'Veggiedent Medium Dog (10 - 30 kg), 15 bucati', 'ARMHAMMER SPRAY DENTAR CAINE, 120 ML', 'Clean Dental 50 g', 'Otoact 100ml', 'Otoprof 100 ml', 'Can Bel 60ml', 'Petkult Clean Drops 40ml', 'CleanAural Dog 50 ml', 'IRYPLUS 50ml');
    lista_medicatie_pisici varr := varr('Sampon Pyoderm Glyco, 200 ml', 'CLOREXYDERM SOLUZIONE 0.5% 250ml', 'CLOREXYDERM SPOT GEL 100ml', 'Veteusan 100 ml', 'ECZEMTRAT 60 Comprimate', 'Supliment nutritiv CAVITROM 150 g', 'Pet Phos Felin 96 tablete', 'VMP Tabs, 50 tablete', 'Rx MegaFlex 600 comprimate', 'CalciTabs 150 tablete', 'Hills Science Plan Adult 1-6 Oral Care Chicken', 'Sanabelle Dental', 'Whiskas Dentabites', 'Malacetic Aural 118 ml', 'IRYPLUS 50ml', 'IRYPLUS WIPES-POCKET, 15 servetele umede', 'Optixcare EYE LUBE, 20 g', 'Optixcare EYE CLEANER, 100ml', 'OTODINE 100ml');
    lista_medicatie_hamsteri varr := varr('TETRACICLINA ATB 250 mg CAPS.', 'Bubbles sampon pentru rozatoare, 250 ml', 'Rodicare Uro, 20 ml', 'RX Amino B-Plex 120 ml', 'Alfa-Vitam Rozatoare- Iepuri 10 ml', 'RX Amino B-Plex 60 ml', 'Chipsi 15 L - Asternut igienic', 'Zolux Asternut Igienic Chinchilla 2 Kg', 'Bio-Lapis, 6 plicuri x 2 g', 'Promedivet Tinctura de iod, 100 ml');
    lista_medicatie_pasari varr := varr('Ectocid Herba Spray, 100 ml', 'Hepavit 1 L', 'Cothivet 30 ml', 'ALAMIN pulbere, 30 g', 'Alfavet Almalyt Energy Porumbei 200 g', 'Multivitamine Vitakraft 10 ml', 'FLAMINGO Os sepie ?i bloc mineral pentru p?s?ri', 'TRIXIE Os de sepie', 'VITAKRAFT Vita Sepia Plus Os de sepie pentru p?s?ri', ' Exo Terra Cricket', 'Tetra Fauna Tortoise 500 ml');
    lista_medicatie_soparle varr := varr('Derma Gel Spray 50 ml', 'Kennel Odor Eliminator, 500 ml', 'Alfa-Vitam Rozatoare- Iepuri 10 ml', 'Tetra ReptiSol 50ml', 'Curatarea cu servetele umede a ochilor de 3 ori pe zi si clatirea cu apa calduta');

    v_motiv VARCHAR2(255);
    v_medicatie VARCHAR2(255);
    v_tip_animal VARCHAR2(255);
begin
    DBMS_OUTPUT.PUT_LINE('Inserare tratamente');
    FOR v_i in 1..lista_motiv_programare.count loop
      v_motiv := lista_motiv_programare(v_i);
      FOR v_ii in 1..lista_tip_animal.count loop
        v_tip_animal := lista_tip_animal(v_ii);
        if(v_tip_animal = lista_tip_animal(1)) then
            v_medicatie := lista_medicatie_caini(TRUNC(DBMS_RANDOM.value(0,lista_medicatie_caini.count)) + 1);
        elsif(v_tip_animal = lista_tip_animal(2)) then
            v_medicatie := lista_medicatie_pisici(TRUNC(DBMS_RANDOM.value(0,lista_medicatie_pisici.count)) +1);
        elsif(v_tip_animal = lista_tip_animal(3)) then
            v_medicatie := lista_medicatie_hamsteri(TRUNC(DBMS_RANDOM.value(0,lista_medicatie_hamsteri.count)) + 1);
        elsif(v_tip_animal = lista_tip_animal(4)) then
            v_medicatie := lista_medicatie_pasari(TRUNC(DBMS_RANDOM.value(0,lista_medicatie_pasari.count)) + 1);
        elsif(v_tip_animal = lista_tip_animal(5)) then
            v_medicatie := lista_medicatie_pasari(TRUNC(DBMS_RANDOM.value(0,lista_medicatie_pasari.count)) + 1);
        elsif(v_tip_animal = lista_tip_animal(6)) then
            v_medicatie := lista_medicatie_pasari(TRUNC(DBMS_RANDOM.value(0,lista_medicatie_pasari.count)) + 1);
        else
            v_medicatie := lista_medicatie_soparle(TRUNC(DBMS_RANDOM.value(0,lista_medicatie_soparle.count)) + 1);
        end if;
        insert into tratamente(motiv,medicatie,tip_animal) values(v_motiv,v_medicatie,v_tip_animal);
      end loop;
    end loop;
end;
/
DROP TABLE pacient_tratament CASCADE CONSTRAINTS
/
CREATE TABLE pacient_tratament(
    id INT NOT NULL PRIMARY KEY,
    id_pacient NOT NULL,
    id_tratament NOT NULL,
    CONSTRAINT fk_pacient_tratam_id_pacient FOREIGN KEY (id_pacient) REFERENCES pacienti(id),
    CONSTRAINT fk_pacient_tratam_id_tratament FOREIGN KEY (id_tratament) REFERENCES tratamente(id)

)
/
SET SERVEROUTPUT ON;
DECLARE
    TYPE varr IS VARRAY(1000) OF VARCHAR2(255);
    lista_tip_animal varr := varr('Caine', 'Pisica', 'Hamster', 'Perus', 'Papagal', 'Porumbel', 'Soparla');
    v_tip_animal VARCHAR2(255);
    v_id_tratament INT;
    v_id_random INT;
begin
    DBMS_OUTPUT.PUT_LINE('Inserare pacient-tratament');
    FOR v_i in 1..100 loop
        select tip_animal into v_tip_animal from pacienti where id=v_i;
        v_id_random := TRUNC(DBMS_RANDOM.value(0,12))+1; 
        --select id into v_id_tratament from tratamente where tip_animal=v_tip_animal and rownum<v_id_random+1 minus select id into v_id_tratament from tratamente where tip_animal=v_tip_animal and rownum<v_id_random;
        select id into v_id_tratament from (select id,rownum as line_nr from tratamente where tip_animal=v_tip_animal) where line_nr=v_id_random; 
        insert into pacient_tratament values (v_i,v_i,v_id_tratament);
    end loop;
end;
/
create index exista_cont on useri(email, password);
/
drop view find_doctor;
/
create view find_doctor(nume_doctor, prenume_doctor, specializare_animal) 
    as select nume, prenume, tip_animal from doctori, tip_animal, specializare 
    where specializare.id_doctor=doctori.id and specializare.id_animal=tip_animal.id; 
  
drop view find_programare_for_stapani;
/
create view find_programare_for_stapani(nume_doctor, prenume_doctor, data_programare, ora_programare)
    as select nume, prenume, data, ora from doctori, programari
    where doctori.id=programari.id_doctor;
  
drop view find_programare_for_doctori;  
/
create view find_programare_for_doctori(nume_pacient, varsta_pacient, data_programare, ora_programare, motiv_programare) 
    as select nume, varsta, data, ora, motiv from pacienti, programari where programari.id_pacient=pacienti.id;
    

create or replace package insertDoctori is
    procedure insertIntoDoctori(prenumeDoctor IN doctori.prenume%TYPE, numeDoctor IN doctori.nume%TYPE, varstaDoctor IN doctori.varsta%TYPE, emailDoctor IN doctori.email%TYPE, passwordDoctor IN useri.password%TYPE, numar_telefonDoctor IN doctori.numar_telefon%TYPE);
end insertDoctori;

create or replace package body insertDoctori is
    procedure insertIntoDoctori(prenumeDoctor IN doctori.prenume%TYPE, numeDoctor IN doctori.nume%TYPE, varstaDoctor IN doctori.varsta%TYPE, emailDoctor IN doctori.email%TYPE, passwordDoctor IN useri.password%TYPE, numar_telefonDoctor IN doctori.numar_telefon%TYPE)
      is
        existaDoctor NUMBER(1);
        id_doctor NUMBER(10);
        id_user NUMBER(10);
        stapanValue NUMBER(1);
        doctorValue NUMBER(1);
      begin
        select count(*) into existaDoctor from doctori where email = emailDoctor;
        
        if(existaDoctor = 0) then
            select id into id_doctor from (select * from doctori order by id desc) where rownum = 1;
            id_doctor := id_doctor + 1;
            insert into doctori(id, nume, prenume, varsta, email, numar_telefon)
              values(id_doctor, numeDoctor, prenumeDoctor, varstaDoctor, emailDoctor, numar_telefonDoctor);
              
            select id into id_user from (select * from useri order by id desc) where rownum = 1;
            id_user := id_user + 1;
            doctorValue := 1;
            stapanValue :=0;
            insert into useri(id, email, password, doctor, stapan)
              values(id_user, emailDoctor, passwordDoctor, doctorValue, stapanValue);
            
        end if;
      end;
end insertDoctori;

/*
set serveroutput on;
BEGIN
  insertDoctori.insertIntoDoctori('Mihai', 'Mararara', '24', 'marararamihai@yahoo.ro', 'parolamea', '0734894121');
END;

select * from doctori where nume = 'Mararara';
select * from useri where email = 'marararamihai@yahoo.ro';
*/

create or replace package insertStapani is
    procedure insertIntoStapani(prenumeStapan IN stapani.prenume%TYPE, numeStapan IN stapani.nume%TYPE, varstaStapan IN stapani.varsta%TYPE, emailStapan IN stapani.email%TYPE, passwordStapan IN useri.password%TYPE, numar_telefonStapan IN stapani.numar_telefon%TYPE);
end insertStapani;

create or replace package body insertStapani is
      procedure insertIntoStapani(prenumeStapan IN stapani.prenume%TYPE, numeStapan IN stapani.nume%TYPE, varstaStapan IN stapani.varsta%TYPE, emailStapan IN stapani.email%TYPE, passwordStapan IN useri.password%TYPE, numar_telefonStapan IN stapani.numar_telefon%TYPE)
        is
          existaStapan NUMBER(1);
          id_stapan NUMBER(30);
          id_user NUMBER(30);
          doctorValue NUMBER(1);
          stapanValue NUMBER(1);
        begin
          select count(*) into existaStapan from stapani where email = emailStapan;
          
          if(existaStapan = 0) then
            select id into id_stapan from (select * from stapani order by id desc) where rownum = 1;
            id_stapan := id_stapan + 1;
            insert into stapani(id, nume, prenume, varsta, email, numar_telefon)
              values(id_stapan, numeStapan, prenumeStapan, varstaStapan, emailStapan, numar_telefonStapan);
          
            select id into id_user from (select * from useri order by id desc) where rownum = 1;
            id_user := id_user + 1;
            doctorValue := 0;
            stapanValue := 1;
            insert into useri(id, email, password, doctor, stapan)
              values(id_user, emailStapan, passwordStapan, doctorValue, stapanValue);
          end if;
        end;
end insertStapani;

/*
set serveroutput on;
BEGIN
  insertStapani.insertIntoStapani('Mihai', 'Mararara', '23', 'marararamihai@yahoo.ro', 'parolamea', '0734894121');
END;

select * from stapani where nume = 'Mararara';
select * from useri where email = 'marararamihai@yahoo.ro';
*/

create or replace function returnDoctorByName(numeDoctor IN find_doctor.nume_doctor%TYPE, prenumeDoctor IN find_doctor.prenume_doctor%TYPE)
return VARCHAR2 AS
    numberOfDoctors NUMBER(30);
    numeComplet VARCHAR2(100);
begin
    select count(*) into numberOfDoctors from find_doctor where nume_doctor = numeDoctor and prenume_doctor = prenumeDoctor;
    if(numberOfDoctors != 0) then
      numeComplet := concat(concat(numeDoctor, ' '), prenumeDoctor);
      return numeComplet;
    else
      return 'Doctotul nu exista';
    end if;
end;

/*
select returnDoctorByName('Mandra', 'Codrina') from dual;
*/

--doctorii care se ocupa de un anumit tip de animal
-- pipelined table function --
create type findTypeAnimal_type is object 
  (nume_doctor VARCHAR2(15), prenume_doctor VARCHAR2(30));

--folosim findProgramareDoctori_type ca output
create type t_findTypeAnimal_type as table of findTypeAnimal_type;

create or replace function findTypeAnimal(numeTip VARCHAR2) return t_findTypeAnimal_type PIPELINED
  as
    queue_obj t_findTypeAnimal_type;
  begin
    for r_row in (select nume_doctor, prenume_doctor from find_doctor where specializare_animal = numeTip)
    loop
        pipe row(findTypeAnimal_type(r_row.nume_doctor, r_row.prenume_doctor));
      end loop;
end findTypeAnimal;

/*
select * from table(findTypeAnimal('Papagal'));
*/

create or replace package adaugaONouaProgramare is
    procedure asignarePacientDoctor(numePacient IN VARCHAR2, tipPacient IN VARCHAR2, varstaPacient IN NUMBER, numeDoctor IN VARCHAR2, prenumeDoctor IN VARCHAR2, dataDorita IN DATE, oraDorita IN VARCHAR2, motivConsultatie IN VARCHAR2);
end adaugaONouaProgramare;

create or replace package body adaugaONouaProgramare is
    procedure asignarePacientDoctor(numePacient IN VARCHAR2, tipPacient IN VARCHAR2, varstaPacient IN NUMBER, numeDoctor IN VARCHAR2, prenumeDoctor IN VARCHAR2, dataDorita IN DATE, oraDorita IN VARCHAR2, motivConsultatie IN VARCHAR2)
    is
      existaProgramare NUMBER;
      id_programare NUMBER;
      id_doctor NUMBER;
      id_pacient NUMBER;
      id_stapan NUMBER;
      id_pacient_stapan NUMBER;
      foundPacient SYS_REFCURSOR;
      lineByLine NUMBER;
    begin
      select count(*) into existaProgramare from programari p join doctori d on p.id_doctor = d.id
          where d.nume = numeDoctor and d.prenume = prenumeDoctor and TO_CHAR(p.data, 'DD-MON-YY') = dataDorita and p.ora = oraDorita;
          
         if(existaProgramare = 0) then
            select id into id_programare from (select * from programari order by id desc) where rownum = 1;
            id_programare := id_programare + 1;
      
            open foundPacient for select id from pacienti where nume = numePacient and tip_animal = tipPacient and varsta = varstaPacient;
            fetch foundPacient into lineByLine;
                if foundPacient%NOTFOUND then
                    DBMS_OUTPUT.PUT_LINE('Pacientul respectiv nu exista');
                    /*select id into id_pacient from (select * from pacienti order by id desc) where rownum = 1;
                    id_pacient := id_pacient + 1;               
                    insert into pacienti values (id_pacient, numePacient, varstaPacient, tipPacient);
                    */
                else
                    select id into id_pacient from pacienti where nume = numePacient and varsta = varstaPacient and tip_animal = tipPacient;
                    select id into id_doctor from doctori where nume = numeDoctor and prenume = prenumeDoctor;
                    insert into programari values(id_programare, id_doctor, id_pacient, dataDorita, oraDorita, motivConsultatie);
                end if;
            close foundPacient;
        else 
          DBMS_OUTPUT.PUT_LINE('Exista deja o programare la ora respectiva');
        end if;
    end asignarePacientDoctor;
end adaugaONouaProgramare;

/*
set serveroutput on;
begin
  adaugaONouaProgramare.asignarePacientDoctor('Budincuta', 'Pisica', '12', 'Jneapan', 'Madalin', '12-AUG-19', '11:00', 'Stomatologie');
end;
*/
/*
select * from doctori where id=5;
select * from useri where doctor =1;
select d.id, t.tip_animal, c.id_user, d.nume, d.prenume from tip_animal t join specializare a on a.id_animal = t.id join doctori d on d.id = a.id_doctor
    join doctoriuseri c on c.id_doctor = d.id join useri p on p.id = c.id_user where t.tip_animal='Pisica';
*/

-- pipelined table function --
create type findProgramareDoctori_tye is object 
  (nume_pacient VARCHAR2(30), varsta_pacient VARCHAR2(2), tip_pacient VARCHAR(15), data_programare DATE, ora_programare VARCHAR2(10), motiv_programare VARCHAR2(225));

--folosim findProgramareDoctori_type ca output
create type t_findProgramareDoctori_tye as table of findProgramareDoctori_tye;

create or replace function afiseazaProgramariDoctor(idDoctorUser INT) return t_findProgramareDoctori_tye pipelined
  as
    queue_obj t_findProgramareDoctori_tye;
  begin
    for r_row in (select p.nume, p.varsta, p.tip_animal, r.data, r.ora, r.motiv from pacienti p
                  join programari r on r.id_pacient = p.id join doctori d on d.id = r.id_doctor 
                  join doctoriuseri a on a.id_doctor = d.id join useri c on c.id = a.id_user where c.id = idDoctorUser)
      loop
        pipe row(findProgramareDoctori_tye(r_row.nume, r_row.varsta, r_row.tip_animal, r_row.data, r_row.ora, r_row.motiv));
      end loop;
end afiseazaProgramariDoctor;

select * from useri where id=40;
/*
select * from table(afiseazaProgramariDoctor(40));
*/

create or replace function findProgramare(numePacient VARCHAR2) return VARCHAR2
as
  dataProgramare DATE;
  oraProgramare VARCHAR(10);
  programare VARCHAR(100);
begin
  select data, ora into dataProgramare, oraProgramare from programari where id_pacient = (select id from pacienti where nume = numePacient);
   programare := concat(concat(dataProgramare, ' '), oraProgramare);
  return programare;
end findProgramare;

/*
select findProgramare('Buburuza') from dual;
*/

create or replace function pacientDupaID(idPacient NUMBER) return VARCHAR2 
as
  numePacient VARCHAR2(30);
begin
    select nume into numePacient from pacienti where id = idPacient;
    return numePacient;
end pacientDupaID;

/*
select pacientDupaID(1) from dual;
*/

create or replace function returnNumarTelefon(numeUser VARCHAR2, prenumeUser VARCHAR2) return varchar2
as
  numarTelefon VARCHAR2(10);
  esteDoctor NUMBER := 0;
begin
  select count(*) into esteDoctor from doctori where nume = numeUser and prenume = prenumeUser;  
  if(esteDoctor = 1) then
      select numar_telefon into numarTelefon from doctori where nume = numeUser and prenume = prenumeUser;
  else
      select numar_telefon into numarTelefon from stapani where nume = numeUser and prenume = prenumeUser;
  end if;
  return numarTelefon;
end returnNumarTelefon;

/*
select returnNumarTelefon('Labici', 'Julieta') from dual;
*/

create type tratamenteTrecute_type is object 
  (data_tratament DATE, ora_tratament VARCHAR2(10), nume_doctor VARCHAR2(15), prenume_doctor VARCHAR2(30), motiv_programare VARCHAR2(225), tratament_urmat VARCHAR2(225));

--folosim findProgramareDoctori_type ca output
create type t_tratamenteTrecute_type as table of tratamenteTrecute_type;

create or replace function afiseazaTratamentePacient(numeStapan VARCHAR2, prenumeStapan VARCHAR2, numePacient VARCHAR2) return t_tratamenteTrecute_type pipelined
  as
    queue_obj t_tratamenteTrecute_type;
  begin
    for r_row in (select r.data, r.ora, d.nume, d.prenume, r.motiv, m.medicatie
                  from stapani s join pacient_stapan p on s.id = p.id_stapan 
                  join pacienti a on p.id_pacient = a.id
                  join programari r on r.id_pacient = a.id
                  join doctori d on d.id = r.id_doctor
                  join pacient_tratament t on t.id_pacient = a.id
                  join tratamente m on m.id = t.id_tratament
                  where s.nume = numeStapan and s.prenume = prenumeStapan and a.nume = numePacient and r.data < sysdate)
    loop
        pipe row(tratamenteTrecute_type(r_row.data, r_row.ora, r_row.nume, r_row.prenume, r_row.motiv, r_row.medicatie));
      end loop;
end afiseazaTratamentePacient;

/*
select * from table(afiseazaTratamentePacient('Fuca', 'Andrei', 'Cocorico'));
*/

create or replace function oreDisponibileProg(numeDoctor VARCHAR2, prenumeDoctor VARCHAR2, dataProgramare DATE) return VARCHAR2 as
  v_count VARCHAR2(10);
  v_index NUMBER;
  disponibil NUMBER;
  rezultat VARCHAR2(100);
begin
    for v_index in 10..17 loop
        v_count := concat(v_index, ':00');
        select count(*) into disponibil from programari p
            join doctori d on d.id = p.id_doctor
            where TRIM(p.data) = TRIM(dataProgramare) and TRIM(p.ora) = TRIM(v_count) and d.nume = numeDoctor and d.prenume = prenumeDoctor;
        if(disponibil = 0) then
          rezultat := concat(concat(rezultat, ' '), v_count);
        end if;
    end loop;
    return rezultat;
end oreDisponibileProg;

/*
select oreDisponibileProg('Fuca', 'Andrei', '12-SEP-19') from dual;
*/

--toate animalele unui anumit stapan
create type allAnimals_typ is object (numeAnimal VARCHAR2(15), varstaAnimal NUMBER(2), tipAnimal VARCHAR(15));

--folosim t_allAnimals_type ca output
create type t_allAnimals_typ as table of allAnimals_typ;

create or replace function allAnimals(idStapan INT) return t_allAnimals_typ PIPELINED
  as
    queue_obj t_allAnimals_typ;
  begin
    for r_row in (select p.nume, p.varsta, p.tip_animal from pacienti p join pacient_stapan a on p.id = a.id_pacient 
                  join stapani s on s.id = a.id_stapan join stapaniuseri b on b.id_stapan = s.id join useri u on u.id = b.id_user  
                  where u.id = idStapan)
    loop
        pipe row(allAnimals_typ(r_row.nume, r_row.varsta, r_row.tip_animal));
      end loop;
end allAnimals;
/*
select * from useri where stapan=1;
select * from stapani where nume='Gherca' and prenume='Claudia';
select p.nume from pacienti p join pacient_stapan s on p.id = s.id_pacient where s.id_stapan=1;
*/
/*
select * from table(allAnimals(101));
*/


--toti doctorii
-- pipelined table function --
create type findAnimaleDoctor_type is object 
  (nume_doctor VARCHAR2(15), prenume_doctor VARCHAR2(30), tip_animal VARCHAR2(15), numar_doctor VARCHAR2(10));

--folosim findProgramareDoctori_type ca output
create type t_findAnimaleDoctor_type as table of findAnimaleDoctor_type;

create or replace function findAnimaleDoctor return t_findAnimaleDoctor_type PIPELINED
  as
    queue_obj t_findAnimaleDoctor_type;
  begin
    for r_row in (select d.nume, d.prenume, t.tip_animal, d.numar_telefon from doctori d
                  join specializare s on s.id_doctor = d.id join tip_animal t on t.id = s.id_animal)
    loop
        pipe row(findAnimaleDoctor_type(r_row.nume, r_row.prenume, r_row.tip_animal, r_row.numar_telefon));
      end loop;
end findAnimaleDoctor;

/*
select * from table(findAnimaleDoctor);
*/
/*
select * from useri where email='emag.dorel17@gmail.com';
*/
select * from pacienti;

create or replace package adaugaAnimal is
    procedure adaugaUnNouAnimal(idStapan INT, numeAnimal VARCHAR2, varstaAnimal NUMBER, tipAnimal VARCHAR2);
end adaugaAnimal;

create or replace package body adaugaAnimal is
    procedure adaugaUnNouAnimal(idStapan INT, numeAnimal VARCHAR2, varstaAnimal NUMBER, tipAnimal VARCHAR2)
        is
          existaSpecializare NUMBER;
          id_pacient NUMBER;
          id_pacient_stapan NUMBER;
        begin
          select count(*) into existaSpecializare from tip_animal where tip_animal = tipAnimal;
          if(existaSpecializare != 0) then
              select id into id_pacient from (select * from pacienti order by id desc) where rownum = 1;
              id_pacient := id_pacient + 1;
          
              select id into id_pacient_stapan from (select * from pacient_stapan order by id desc) where rownum = 1;
              id_pacient_stapan := id_pacient_stapan + 1;
          
              insert into pacienti values (id_pacient, numeAnimal, varstaAnimal, tipAnimal);
              insert into pacient_stapan values (id_pacient_stapan, id_pacient, idStapan);
          else
              DBMS_OUTPUT.PUT_LINE('Nu ne ocupam de acest tip de animal.');
          end if;
        end adaugaUnNouAnimal;
end adaugaAnimal;

/*
set serveroutput on;
BEGIN
  adaugaAnimal.adaugaUnNouAnimal('1', 'Mironica', '5', 'Dinozaur');
END;
*/