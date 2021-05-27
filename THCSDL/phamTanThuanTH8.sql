use master
go
if exists (select name from sysdatabases where name='QuanLyThuVien')
		drop database QuanLyThuVien
go
create database QuanLyThuVien
go
use QuanLyThuVien
go

create table DocGia (
	MaDocGia int not null primary key,
	HoTen nvarchar(255),
	NgaySinh date
)

create table LoaiSach (
	MaLoaiSach int not null primary key,
	TenLoaiSach nvarchar(255)
)

create table DauSach (
	MaDauSach int not null,
	TuaSach nvarchar(255),
	TacGia nvarchar(255),
	NgayXuatBan date,
	SoLuong int,
	GiaBan money,
	MaLoaiSach int not null,
	primary key (MaDauSach)
)

create table CuonSach (
	MaCuonSach int not null,
	TinhTrang nvarchar(255),
	MaDauSach int not null,
	primary key (MaCuonSach, MaDauSach)
)

create table DangKy (
	NgayDangKy date,
	MaDocGia int not null,
	MaDauSach int not null,
	primary key (MaDocGia, MaDauSach)
)

create table MuonSach (
	MaCuonSach int not null,
	MaDocGia int not null,
	MaDauSach int not null,
	NgayMuon date,
	NgayHetHan date,
	primary key (MaCuonSach, MaDocGia, MaDauSach)
)

alter table DauSach add constraint FK_LoaiSach_DauSach
foreign key (MaLoaiSach) references LoaiSach(MaLoaiSach)

alter table CuonSach add constraint FK_DauSach_CuonSach
foreign key (MaDauSach) references DauSach(MaDauSach)

alter table DangKy add constraint FK_DauSach_DangKy
foreign key (MaDauSach) references DauSach(MaDauSach)

alter table DangKy add constraint FK_DocGia_DangKy
foreign key (MaDocGia) references DocGia(MaDocGia)

alter table MuonSach add constraint FK_DocGia_MuonSach
foreign key (MaDocGia) references DocGia(MaDocGia)

alter table MuonSach add constraint FK_DauSach_MuonSach
foreign key (MaDauSach) references DauSach(MaDauSach)

alter table MuonSach add constraint FK_CuonSach_MuonSach
foreign key (MaCuonSach) references CuonSach(MaCuonSach)

insert into DocGia values
(1, N'pham tuấn', '23/11/2001'),
(2, N'pham tấn', '3/11/2001'),
(3, N'pham tu', '2/11/2001');

insert into LoaiSach values
(1, 'one life'),
(2, 'two life'),
(3, 'three life');
