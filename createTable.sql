/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2016-07-03 15:32:29                          */
/*==============================================================*/
--create database PaySystem
use PaySystem


if exists (select 1
            from  sysobjects
           where  id = object_id('Manager')
            and   type = 'U')
   drop table Manager
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"Option"')
            and   type = 'U')
   drop table "Option"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PaymentInfo')
            and   type = 'U')
   drop table PaymentInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('student')
            and   type = 'U')
   drop table student
go

/*==============================================================*/
/* Table: Manager                                               */
/*==============================================================*/
create table Manager (
   ID                   int                  identity,
   userName             varchar(40)          null,
   userPwd              varchar(40)          null,
   email                varchar(40)          null,
   constraint PK_MANAGER primary key (ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Manager') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Manager' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '管理员信息', 
   'user', @CurrentUser, 'table', 'Manager'
go

/*==============================================================*/
/* Table: "Option"                                              */
/*==============================================================*/
create table "Option" (
   ID                   int                  identity,
   bankAccount          varchar(30)          null,
   constraint PK_OPTION primary key (ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('"Option"') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Option' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '设置信息', 
   'user', @CurrentUser, 'table', 'Option'
go

/*==============================================================*/
/* Table: PaymentInfo                                           */
/*==============================================================*/
create table PaymentInfo (
   ID                   int                  identity,
   serialNumber         varchar(50)          null,
   paymentStatus        varchar(40)          null,
   paymentSemester      varchar(40)          null,
   paymentDate          date                 null,
   totalPayable         money                null,
   totalPaid            money                null,
   payers               varchar(40)          null,
   department           varchar(40)          null,
   direction            varchar(40)          null,
   tuition              money                null,
   lodging              money                null,
   bookFees             money                null,
   IDCard               varchar(30)          null,
   constraint PK_PAYMENTINFO primary key (ID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PaymentInfo') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PaymentInfo' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '缴费信息表', 
   'user', @CurrentUser, 'table', 'PaymentInfo'
go

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student (
   ID                   int                  identity,
   IDCard               varchar(30)          null,
   name                 varchar(40)          null,
   stuNum               varchar(30)          null,
   department           varchar(40)          null,
   grade                varchar(40)          null,
   sClass               varchar(40)          null,
   direction            varchar(40)          null,
   educationalSystem    varchar(40)          null,
   constraint PK_STUDENT primary key (ID)
)
go






------------------ 插入数据-------------------------------

INSERT INTO [PaySystem].[dbo].[Manager]
           ([userName]
           ,[userPwd]
           ,[email])
     VALUES
           ('admin','admin','3285209@qq.com')
GO

select * from Manager




----------------------------------------------------------------------
INSERT INTO student ([IDCard],[name],[stuNum],[department],[grade],[sClass],[direction],[educationalSystem])
     VALUES('511325198911200734'
           ,'张啸'
           ,'12345567891'
           ,'中文系'
           ,'2015级'
           ,'中文系一班'
           ,'史学'
           ,'4年')
GO

select * from student


--------------------------------------------------------------------------
INSERT INTO PaymentInfo([serialNumber],[paymentStatus],[paymentSemester],[paymentDate],[totalPayable],[totalPaid],[payers],[department],[direction],[tuition],[lodging],[bookFees],[IDCard])
     VALUES
           ('1231231231241231231251231231'
           ,'已缴费'
           ,'2015下'
           ,'2016-7-3'
           ,'32000'
           ,'32000'
           ,'张啸'
           ,'中文系'
           ,'史学'
           ,'26000'
           ,'4000'
           ,'2000'
           ,'511325198911200734')
GO

select * from PaymentInfo

select * from PaymentInfo where IDCard = '511325198911200734'



-------------------------------------------------------------------------
INSERT INTO [Option]([bankAccount])
     VALUES('123123123123123')
GO

select * from [Option]

