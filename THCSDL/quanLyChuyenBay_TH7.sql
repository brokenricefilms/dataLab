-- Phạm Tấn Thuận | DH51902283
use QuanLyChuyenBay
go

select *
from LICHBAY

-- bai 1

select AVG(LUONG) as luongTrungBinh
from NHANVIEN
where LOAINV=0

-- bai 2

select AVG(LUONG) as luongTrungBinh
from NHANVIEN
where LOAINV=1

-- bai 3

select count(CHUYENBAY.MACB) as soLuongChuyenBayXuatPhat
from CHUYENBAY join LICHBAY on CHUYENBAY.MACB=LICHBAY.MACB
where SBDI='MIA' and LICHBAY.NGAYDI='2000-11-01'

-- bai 4

select SBDEN, count(SBDEN) as soLuongChuyenBay
from CHUYENBAY
group by SBDEN
order by soLuongChuyenBay asc

-- bai 5

select SBDI, NGAYDI, count(SBDI) as soLuongChuyenBay
from LICHBAY join CHUYENBAY on LICHBAY.MACB=CHUYENBAY.MACB
where CHUYENBAY.SBDI in ('MIA', 'SLC', 'ORD', 'BOS')
group by NGAYDI, SBDI

-- bai 6

select MACB, NGAYDI, count(LOAINV) as soLuongNhanVienKhongPhaiLaPhiCong
from PHANCONG join NHANVIEN on PHANCONG.MANV=NHANVIEN.MANV
where LOAINV=0
group by MACB, NGAYDI

-- bai 7

select MACB, NGAYDI, count(makh) as soLuongHanhKhachDatCho
from DATCHO
group by MACB, NGAYDI

-- bai 8

select MACB, NGAYDI, sum(LUONG) as tongLuongPhiHanhDoan
from PHANCONG join NHANVIEN on PHANCONG.MANV=NHANVIEN.MANV
group by MACB, NGAYDI
order by tongLuongPhiHanhDoan asc


-- bai 9

select MAYBAY.MALOAI, count(LICHBAY.MALOAI) as soLuongChuyenBay
from MAYBAY join LICHBAY on MAYBAY.MALOAI=LICHBAY.MALOAI and
							MAYBAY.SOHIEU=LICHBAY.SOHIEU
			join CHUYENBAY on LICHBAY.MACB=CHUYENBAY.MACB
where SBDEN='ORD'
group by MAYBAY.MALOAI

-- bai 10

select SBDI
from CHUYENBAY
where GIODI between '10:00:00' and '22:00:00'
group by SBDI
having COUNT(SBDI) > 2

-- bai 11

select TEN
from PHANCONG join NHANVIEN on PHANCONG.MANV=NHANVIEN.MANV
where LOAINV=1 and NGAYDI=NGAYDI
group by TEN
having count(PHANCONG.MANV) > 1

-- bai 12

select MACB, NGAYDI
from DATCHO
group by MACB, NGAYDI
having count(MAKH) < 3

-- bai 13

select SOHIEU, MALOAI
from NHANVIEN join PHANCONG on NHANVIEN.MANV=PHANCONG.MANV
			join LICHBAY on PHANCONG.MACB=LICHBAY.MACB
where NHANVIEN.MANV=1001
group by SOHIEU, MALOAI
having count(SOHIEU) > 1 and count(MALOAI) > 1

-- bai 14

select HANGSX, count(MALOAI) as soLuongMayBay
from LOAIMB
group by HANGSX

-- bai 15

select SBDI, count(SBDI) as tongSoChuyenBay
from CHUYENBAY join LICHBAY on CHUYENBAY.MACB=LICHBAY.MACB
where DATEPART(quarter, NGAYDI) = 4
group by SBDI
having count(SBDI)>=2
order by tongSoChuyenBay desc

--Truy Vấn Con
--16. Cho biết hãng sản xuất, mã loại và số hiệu của máy bay đã được sửdụng nhiều nhất
select HANGSX, LOAIMB.MALOAI, MAYBAY.SOHIEU, COUNT(MACB)
from LOAIMB join MAYBAY on LOAIMB.MALOAI=MAYBAY.MALOAI
     JOIN LICHBAY ON MAYBAY.SOHIEU=LICHBAY.SOHIEU AND MAYBAY.MALOAI=LICHBAY.MALOAI
GROUP BY HANGSX, LOAIMB.MALOAI,MAYBAY.SOHIEU
HAVING  COUNT(MACB) >=ALL(select COUNT(MACB)
							from LICHBAY
							GROUP BY SOHIEU,MALOAI)

--17. Cho biết tên nhân viên được phân công đi nhiều chuyến bay nhất.
--18. Cho biết thông tin của phi công (tên, địa chỉ, điện thoại) lái nhiềuchuyến bay nhất.
--19. Cho biết sân bay (SBDEN) và số lượng chuyến bay của sân bay có ítchuyến bay đáp xuống nhất.
--20. Cho biết sân bay (SBDI) và số lượng chuyến bay của sân bay có nhiềuchuyến bay xuất phát nhất.
--21. Cho biết tên, địa chỉ, và điện thoại của khách hàng đã đi trên nhiềuchuyến bay nhất.
--22. Cho biết mã số, tên và lương của các phi công có khả năng lái nhiềuloại máy bay nhất.
--23. Cho biết thông tin (mã nhân viên, tên, lương) của nhân viên có mứclương cao nhất.
--24. Cho biết tên, địa chỉ của các nhân viên có lương cao nhất trong phihành đoàn (các nhân viên được phân công trong một chuyến bay) màngười đó tham gia.
--25. Cho biết mã chuyến bay, giờ đi và giờ đến của chuyến bay bay sớmnhất trong ngày. 
