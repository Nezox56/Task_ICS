create table SKU  (
  ID int not null IDENTITY(1,1) primary key,
  Code as ('s' + cast(ID as varchar)),
  Name varchar(255)
);

create table Basket (
  ID int not null IDENTITY(1,1) primary key,
  ID_SKU int not null references SKU(ID),
  Quantity int not null CHECK (Quantity > 0),
  Value int not null CHECK (Value > 0),
  PurchaseDate date not null Default (GETDATE ()),
  DiscountValue int 
);

create table Family (
  ID int not null IDENTITY(1,1) primary key, 
  FamilySurName varchar(50) not null, 
  BudgetValue int
);