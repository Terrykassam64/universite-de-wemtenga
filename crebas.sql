/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  28/07/2023 13:25:32                      */
/*==============================================================*/


drop table if exists Autres_membres_du_jury;

drop table if exists Directeur_de_memoir;

drop table if exists Etudiant;

drop table if exists Filiere;

drop table if exists Maitre_de_stage;

drop table if exists Note_du_jury;

drop table if exists Planning_des_soutenance;

drop table if exists Reservation_pour_la_salle_de_soutenance;

drop table if exists Role;

drop table if exists Salle_de_soutenance;

drop table if exists Situation_de_la_soutenance;

drop table if exists Validite_pour_soutenir;

/*==============================================================*/
/* Table : Autres_membres_du_jury                               */
/*==============================================================*/
create table Autres_membres_du_jury
(
   id                   int not null,
   Not_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   email                varchar(254),
   fonction             varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Directeur_de_memoir                                  */
/*==============================================================*/
create table Directeur_de_memoir
(
   id                   int not null,
   Not_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   email                varchar(254),
   sex                  varchar(254),
   fonction             varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Etudiant                                             */
/*==============================================================*/
create table Etudiant
(
   id                   int not null,
   Fil_id               int,
   Val_id               int,
   Dir_id               int,
   Mai_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   adresse              varchar(254),
   email                varchar(254),
   age                  int,
   sex                  varchar(254),
   niveau               int,
   primary key (id)
);

/*==============================================================*/
/* Table : Filiere                                              */
/*==============================================================*/
create table Filiere
(
   id                   int not null,
   informatique_generale varchar(254),
   genie_logiciel       varchar(254),
   reseaux_informatique varchar(254),
   securite_informatique varchar(254),
   intelligence_artificielle varchar(254),
   informatique_biomedicale varchar(254),
   informatique_embarque varchar(254),
   informatique_theorique varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Maitre_de_stage                                      */
/*==============================================================*/
create table Maitre_de_stage
(
   id                   int not null,
   Not_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   email                varchar(254),
   sex                  varchar(254),
   fonction             varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Note_du_jury                                         */
/*==============================================================*/
create table Note_du_jury
(
   id                   int not null,
   note                 int,
   primary key (id)
);

/*==============================================================*/
/* Table : Planning_des_soutenance                              */
/*==============================================================*/
create table Planning_des_soutenance
(
   id                   int not null,
   Val_id               int,
   date_de_la_soutenance datetime,
   primary key (id)
);

/*==============================================================*/
/* Table : Reservation_pour_la_salle_de_soutenance              */
/*==============================================================*/
create table Reservation_pour_la_salle_de_soutenance
(
   id                   int not null,
   primary key (id)
);

/*==============================================================*/
/* Table : Role                                                 */
/*==============================================================*/
create table Role
(
   id                   int not null,
   administrateur       varchar(254),
   utilisateur          varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Salle_de_soutenance                                  */
/*==============================================================*/
create table Salle_de_soutenance
(
   id                   int not null,
   Pla_id               int,
   nom                  varchar(254),
   numero               int,
   primary key (id)
);

/*==============================================================*/
/* Table : Situation_de_la_soutenance                           */
/*==============================================================*/
create table Situation_de_la_soutenance
(
   id                   int not null,
   Pla_id               int,
   a_venir              varchar(254),
   passer               varchar(254),
   annuler              varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Validite_pour_soutenir                               */
/*==============================================================*/
create table Validite_pour_soutenir
(
   id                   int not null,
   valide               varchar(254),
   invalide             varchar(254),
   primary key (id)
);

alter table Autres_membres_du_jury add constraint FK_Association_7 foreign key (Not_id)
      references Note_du_jury (id) on delete restrict on update restrict;

alter table Directeur_de_memoir add constraint FK_Association_6 foreign key (Not_id)
      references Note_du_jury (id) on delete restrict on update restrict;

alter table Etudiant add constraint FK_Association_1 foreign key (Mai_id)
      references Maitre_de_stage (id) on delete restrict on update restrict;

alter table Etudiant add constraint FK_Association_2 foreign key (Dir_id)
      references Directeur_de_memoir (id) on delete restrict on update restrict;

alter table Etudiant add constraint FK_Association_3 foreign key (Fil_id)
      references Filiere (id) on delete restrict on update restrict;

alter table Etudiant add constraint FK_Association_4 foreign key (Val_id)
      references Validite_pour_soutenir (id) on delete restrict on update restrict;

alter table Maitre_de_stage add constraint FK_Association_5 foreign key (Not_id)
      references Note_du_jury (id) on delete restrict on update restrict;

alter table Planning_des_soutenance add constraint FK_Association_8 foreign key (Val_id)
      references Validite_pour_soutenir (id) on delete restrict on update restrict;

alter table Salle_de_soutenance add constraint FK_Association_9 foreign key (Pla_id)
      references Planning_des_soutenance (id) on delete restrict on update restrict;

alter table Situation_de_la_soutenance add constraint FK_Association_10 foreign key (Pla_id)
      references Planning_des_soutenance (id) on delete restrict on update restrict;

