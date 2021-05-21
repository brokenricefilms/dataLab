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
	HoTen varchar(255),
	NgaySinh date
)

create table LoaiSach (
	MaLoaiSach int not null primary key,
	TenLoaiSach varchar(255)
)

create table DauSach (
	MaDauSach int not null,
	TuaSach varchar(255),
	TacGia varchar(255),
	NgayXuatBan date,
	SoLuong int,
	GiaBan money,
	MaLoaiSach int not null,
	primary key (MaDauSach)
)

create table CuonSach (
	MaCuonSach int not null,
	TinhTrang varchar(255),
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
