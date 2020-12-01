CREATE DATABASE IF NOT EXISTS inpi;

/* ----------------------------------------- */

USE inpi;

/* ----------------------------------------- */

create table tb_faixas
(
    Id        int        not null,
    Inicio    int        not null,
    Fim       int        null,
    Status    varchar(1) not null,
    Progresso int        not null
);

create unique index tb_faixas_id_uindex
    on tb_faixas (Id);

alter table tb_faixas
    add constraint tb_faixas_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_marca
(
    Id           bigint       not null,
    processo     varchar(25)  not null,
    Marca        varchar(250) null,
    Situacao     varchar(100) not null,
    Apresentacao varchar(50)  not null,
    Natureza     varchar(50)  not null,
    Foto         bool         not null
);

create unique index table_name_id_uindex
    on tb_marca (Id);

create unique index tb_marca_id_uindex
    on tb_marca (Id);

alter table tb_marca
    add constraint tb_marca_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_servico
(
    Id             int    not null,
    ClasseNice     int    null,
    Nice           text   null,
    SituacaoClasse text   null,
    Especificacao  text   null,
    IdMarca        bigint not null,
    constraint tb_servico_tb_marca_Id_fk
        foreign key (IdMarca) references tb_marca (Id)
            on update cascade on delete cascade
);

create unique index tb_servico_Id_uindex
    on tb_servico (Id);

alter table tb_servico
    add constraint tb_servico_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_class_viena
(
    Id        int         not null,
    Edicao    int         not null,
    Codigo    varchar(10) not null,
    Descricao text        not null,
    IdMarca   bigint      not null,
    constraint tb_class_viena_tb_marca_Id_fk
        foreign key (IdMarca) references tb_marca (Id)
            on update cascade on delete cascade
);

create unique index tb_class_viena_Id_uindex
    on tb_class_viena (Id);

alter table tb_class_viena
    add constraint tb_class_viena_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_titulares
(
    Id      int          not null,
    Ordem   int          not null,
    Nome    varchar(300) not null,
    IdMarca bigint       not null,
    constraint tb_titulares_tb_marca_Id_fk
        foreign key (IdMarca) references tb_marca (Id)
            on update cascade on delete cascade
);

create unique index tb_titulares_Id_uindex
    on tb_titulares (Id);

alter table tb_titulares
    add constraint tb_titulares_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_representante_legal
(
    Id         int          not null,
    Procurador varchar(250) not null,
    IdMarca    bigint       null,
    constraint tb_representante_legal_tb_marca_Id_fk
        foreign key (IdMarca) references tb_marca (Id)
            on update cascade on delete cascade
);

create unique index tb_representante_legal_Id_uindex
    on tb_representante_legal (Id);

alter table tb_representante_legal
    add constraint tb_representante_legal_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_datas
(
    Id        int    not null,
    Deposito  date   null,
    Concessao date   null,
    Vigencia  int    null,
    IdMarca   bigint not null,
    constraint tb_datas_tb_marca_Id_fk
        foreign key (IdMarca) references tb_marca (Id)
            on update cascade on delete cascade
);

create unique index tb_datas_Id_uindex
    on tb_datas (Id);

alter table tb_datas
    add constraint tb_datas_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_peticoes
(
    Id        int          not null,
    Pgo       bool         not null,
    Protocolo varchar(15)  not null,
    Data      date         not null,
    Servico   varchar(500) not null,
    Cliente   varchar(300) null,
    IdMarca   bigint       null,
    constraint tb_peticoes_tb_marca_Id_fk
        foreign key (IdMarca) references tb_marca (Id)
            on update cascade on delete cascade
);

create unique index tb_peticoes_Id_uindex
    on tb_peticoes (Id);

alter table tb_peticoes
    add constraint tb_peticoes_pk
        primary key (Id);

/* ----------------------------------------- */

create table tb_publicacoes
(
    Id          int          not null,
    RPI         int          not null,
    DataRPI     date         not null,
    Despacho    varchar(250) not null,
    Complemento text         null,
    IdMarca     bigint       not null,
    constraint tb_publicacoes_tb_marca_Id_fk
        foreign key (IdMarca) references tb_marca (Id)
            on update cascade on delete cascade
);

create unique index tb_publicacoes_Id_uindex
    on tb_publicacoes (Id);

alter table tb_publicacoes
    add constraint tb_publicacoes_pk
        primary key (Id);

