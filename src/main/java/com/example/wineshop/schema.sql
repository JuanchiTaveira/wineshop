SET FOREIGN_KEY_CHECKS=0;

drop table if exists winery ;
create table winery
(
    id   integer auto_increment primary key,
    name varchar(255)
);
insert into winery (name, id) (select distinct winery, 0 from wines_spa);

drop table if exists type;
create table type
(
    id   integer auto_increment primary key,
    name varchar(255)
);
insert into type (name, id) (select distinct type, 0 from wines_spa);

drop table if exists region;
create table region
(
    id      integer auto_increment primary key,
    name    varchar(255),
    country varchar(255)
);
insert into region (name, id, country) (select distinct region, 0, 'Espana' from wines_spa);


drop table if exists wine;
create table wine
(
    id          integer auto_increment primary key,
    name        varchar(255),
    year        varchar(255),
    acidity     integer,
    body        integer,
    num_reviews integer,
    price       integer,
    rating      integer,
    winery_id   integer references winery (id),
    type_id     integer references type (id),
    region_id   integer references region (id)
);


insert into wine
select w.id      as id,
       w.wine    as name,
       w.year    as year,
       w.acidity as acidity,
       w.body    as body,
       w.num_reviews as num_reviews,
       w.price   as price,
       w.rating  as rating,
       winery.id as winery_id,
       type.id   as type_id,
       region.id as region_id
from wines_spa w
         left join winery on winery.name = w.winery
         left join type on type.name = w.type
         left join region on region.name = w.region
order by id;

SET FOREIGN_KEY_CHECKS=1;