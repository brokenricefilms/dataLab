use QuanLyGiaoVu
go

drop table KETQUA
create table KETQUA (
	namhoc char(9) not null,
	hocky int not null,
	masv char(5) not null,
	mamh varchar(4) not null,
	lanthi int not null,
	diemLT int,
	diemTH int,
	primary key (namhoc, hocky, masv, mamh, lanthi)
)

alter table KETQUA add constraint FK_MONHOC_KETQUA
foreign key (mamh) references MONHOC(mamh)

alter table KETQUA add constraint FK_SINHVIEN_KETQUA
foreign key (masv) references SINHVIEN(masv)

-- alter table KETQUA
-- drop constraint check1
alter table KETQUA
add constraint check1 check (diemLT <= 10 and
       				diemLT >= 0 and
			       	diemTH >= 0 and
			       	diemTH <= 10)

INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'91002', N'CSDL', 1, 9, 7.5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'91007', N'CTDL', 1, 8.5, 7.5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'91024', N'CSDL', 1, 6, 5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'91024', N'CTDL', 1, 4.5, 5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92001', N'CTDL', 1, 7, 6)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92013', N'CTDL', 1, 8, 8)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92024', N'CTDL', 1, 4, 6)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92024', N'CTDL', 2, 7, 7)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92025', N'CTDL', 1, 8, 7)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92027', N'VLDC', 1, 8, NULL)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92031', N'VLDC', 1, 7, NULL)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92048', N'VLDC', 1, 6, NULL)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92173', N'SHDC', 1, 9, 8.5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92188', N'SHDC', 1, 9, 8)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 1, N'92242', N'SHDC', 1, 7, 7)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91007', N'CSDL', 1, 9, 8)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91023', N'CSDL', 1, 8, 7)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91024', N'CTDL', 2, 6, 6.5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91045', N'TKMC', 1, 5, 5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91088', N'TKMC', 1, 4, 5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91088', N'TKMC', 2, 6, 7)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91102', N'TKMC', 1, 9, 8)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91109', N'CNGE', 1, 6, 6.5)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91120', N'CNGE', 1, 9, 8)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91133', N'CNGE', 1, 3, 3)
INSERT [dbo].[KETQUA] ([namhoc], [hocky], [masv], [mamh], [lanthi], [diemLT], [diemTH]) VALUES (N'2014-2015', 2, N'91133', N'CNGE', 2, 5, 5.5)

-- alter table SINHVIEN
-- drop constraint check2
alter table SINHVIEN
add constraint check2 check ((year(getdate()) - year(ngaysinh)) > 17)

-- select year(getdate()) - year(ngaysinh) as tuoi
-- from SINHVIEN

drop table DIEM_CTDL
create table DIEM_CTDL (
	namhoc char(9),
	hocky int,
	masv char(5),
	lanthi int,
	diemLT int,
	diemTH int,
	hosv nvarchar(20),
	tensv nvarchar(10),
	tenmh nvarchar(50)
)

delete from DIEM_CTDL
insert into DIEM_CTDL (hosv, tensv, namhoc, hocky, masv, lanthi, diemLT, diemTH, tenmh)
select hosv, tensv, namhoc, hocky, KETQUA.masv, lanthi, diemLT, diemTH, tenmh
from KETQUA join SINHVIEN on KETQUA.masv=SINHVIEN.masv
	join MONHOC on KETQUA.mamh=MONHOC.mamh
where tenmh=N'Cơ sở dữ liệu'

-- select *
-- from DIEM_CTDL

update MONHOC
set sotietLT=sotietLT+sotietTH, sotietTH=0
where tenmh=N'Sinh học đại cương'

delete from DIEM_CTDL
where diemLT < 5 and lanthi = 1

select *
from SINHVIEN
where hocbong is not null
order by hocbong desc

select *
from SINHVIEN
where makhoa in ('CNTT', 'VL', 'QTKD', 'XD')

select masv, hosv, tensv, year(getdate()) - year(ngaysinh) as tuoi
from SINHVIEN
order by year(getdate()) - year(ngaysinh) asc

select *
from SINHVIEN
where datepart(qq, ngaysinh) = 4 and year(ngaysinh) = 1996

select *
from THI
where hocky='2014-2015'
group by ngaythi, giothi

select *
from THI
