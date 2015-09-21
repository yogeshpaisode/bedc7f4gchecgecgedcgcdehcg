create database nawandarfilmesdistribution;
use nawandarfilmesdistribution;

create table Party_Detail (
   p_id INT NOT NULL auto_increment,
   p_name text,
   p_email text,
   p_password text,
   p_std_code int,
   p_office_number text,
   p_address text,
   p_state text,
   p_city text,
   p_fax text,
   p_country text,
   p_circuit text,
   p_circuit_region text,
   p_datetime_addition date,
   PRIMARY KEY (p_id)
);

create table Members_Detail (
   m_id INT NOT NULL auto_increment,
   p_id int,
   m_name text,
   m_email text,
   m_contact text,   
   PRIMARY KEY (m_id),
   FOREIGN KEY (p_id) REFERENCES Party_Detail(p_id)
);

create table Theater_Detail (
   t_id INT NOT NULL auto_increment,
   p_id int,
   t_name text,
   t_address text,
   t_state text,
   t_city text,
   t_country text,
   t_email text,
   t_std_code int,
   t_phone_number text,
   t_type text,   
   t_datetime_addition date,
   t_no_Screens int,
   PRIMARY KEY (t_id),
   FOREIGN KEY (p_id) REFERENCES Party_Detail(p_id)
);

create table Screen_Detail (
   s_id INT NOT NULL auto_increment,
   p_id int,
   t_id int,
   
   s_name text,
   s_number int,
   s_seats int,
   
   PRIMARY KEY (s_id),
   FOREIGN KEY (p_id) REFERENCES Party_Detail(p_id),
   FOREIGN KEY (t_id) REFERENCES Theater_Detail(t_id)
);

create table Movie_Detail (
   mov_id INT NOT NULL auto_increment,
   mov_name text,
   mov_produces text,
   mov_release_Date date,
   mov_bannes_img_Link text,
   mov_youtube_Link text,   
   PRIMARY KEY (mov_id)
);

create table Work_Order (
   wo_id INT NOT NULL auto_increment,
   mov_id int,
   p_id int,
   t_id int,
   s_id int,
   
   wo_shows_perDay int,
   wo_unlock_key text,
   wo_startDate date,
   wo_endDate date,
   wo_mg boolean,
   wo_mg_amount double,
   wo_rent boolean,
   wo_sharing boolean,
   wo_aggrement boolean,
   wo_sent_email boolean,

   wo_date_time_ofAddtion date, 
   
   
   PRIMARY KEY (wo_id),
   FOREIGN KEY (p_id) REFERENCES Party_Detail(p_id),
   FOREIGN KEY (t_id) REFERENCES Theater_Detail(t_id),
   FOREIGN KEY (s_id) REFERENCES Screen_Detail(s_id),
   FOREIGN KEY (mov_id) REFERENCES Movie_Detail(mov_id)
);


create table wo_agrrement (
   wo_aggri_id INT NOT NULL auto_increment,
   wo_id int,
   
   week_no int,
   theater_rent double,
   distributer_share double,
   owner_share double,
   start_date date,
   end_date date,

   PRIMARY KEY (wo_aggri_id),
   FOREIGN KEY (wo_id) REFERENCES Work_Order(wo_id)
);


create table NEFT_RTGS_Payment (
   nr_id INT NOT NULL auto_increment,
   wo_id int,

    UTR_no text,
depositer_name text,
neft boolean,
rtgs boolean,
amt_recv double,
amt_recv_date date,
amt_recv_time text,
recv_mg boolean,
rec_other boolean,
entry_date_time date,
   
   PRIMARY KEY (nr_id),
   FOREIGN KEY (wo_id) REFERENCES Work_Order(wo_id)
);


create table Cheaque_Payment (
cheaque_id INT NOT NULL auto_increment,
wo_id int,

cheaque_no text,
bank_name text,

depositer_name text,
amt_recv double,
amt_recv_date date,
amt_recv_time text,
recv_mg boolean,
rec_other boolean,
entry_date_time date,
   
   PRIMARY KEY (cheaque_id),
   FOREIGN KEY (wo_id) REFERENCES Work_Order(wo_id)
);


create table Cash_Payment (
cash_id INT NOT NULL auto_increment,
wo_id int,

depositer_name text,
amt_recv double,
amt_recv_date date,
amt_recv_time text,
recv_mg boolean,
rec_other boolean,
entry_date_time date,
   
PRIMARY KEY (cash_id),
FOREIGN KEY (wo_id) REFERENCES Work_Order(wo_id)
);



create table Profit_Ticket_Log (
pt_id INT NOT NULL auto_increment,
wo_id int,
ticket_sold int,
gross_profit double,
nett_profit double,
edtax_profit double,
log_date date,
entry_date_time date,

PRIMARY KEY (pt_id),
FOREIGN KEY (wo_id) REFERENCES Work_Order(wo_id)
);

