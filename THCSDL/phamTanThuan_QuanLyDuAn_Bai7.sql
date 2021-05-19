-- Phạm Tấn Thuận | DH51902283
-- Bài 7: truy vấn con

use QuanLyDeAn
go

-- bai 1
select  HONV, TENLOT, TENNV
from NHANVIEN
where LUONG > (select AVG(LUONG)
				from NHANVIEN join PHONGBAN on NHANVIEN.PHONG=PHONGBAN.MAPHG
				where MAPHG=5)

-- bai 2
select HONV, TENLOT, TENNV, MANV
from NHANVIEN
where MANV != all (select MA_NVIEN
					from THANNHAN)

-- bai 3
select *
from NHANVIEN join PHONGBAN on PHONGBAN.TRUONGPHG=NHANVIEN.MANV
where MANV in (select MA_NVIEN
				from THANNHAN
				group by MA_NVIEN
				having MA_NVIEN > 1)

--  bai 4
select DEAN.MADA
from DEAN join PHONGBAN on DEAN.PHONG=PHONGBAN.MAPHG
		join NHANVIEN on PHONGBAN.MAPHG=NHANVIEN.PHONG
where DEAN.MADA != all (select MADA
						from PHANCONG
						where MA_NVIEN = 009)
	  and DEAN.PHONG = (select PHONG
						from NHANVIEN
						where MANV=009)
group by MADA

-- bai 9: danh sách những nhân viên (honv, tenlot, tennv) có trên 2 thân nhân
select HONV, TENLOT, tennv
from NHANVIEN
where nhanvien.MANV = any (select MA_NVIEN
				from THANNHAN
				group by MA_NVIEN
				having MA_NVIEN > 1)

-- bai 10:
select HONV, TENLOT, TENNV
from NHANVIEN left join THANNHAN on THANNHAN.MA_NVIEN=NHANVIEN.MANV
where MA_NVIEN is null

select HONV, TENLOT, TENNV
from NHANVIEN
where MANV not in (select MA_NVIEN
						from THANNHAN)

select HONV, TENLOT, TENNV
from NHANVIEN
where not exists (select *
					from THANNHAN
					where NHANVIEN.MANV=THANNHAN.MA_NVIEN)

-- bai 11
select HONV
from NHANVIEN join PHONGBAN on PHONGBAN.TRUONGPHG=NHANVIEN.MANV
where MANV != all (select MA_NVIEN
				from THANNHAN
				group by MA_NVIEN)

-- bai 5
select TENPHG, HONV, TENLOT, TENNV
from PHONGBAN join NHANVIEN on phongban.TRUONGPHG=nhanvien.MANV
where MAPHG = (select top 1 PHONG
				from nhanvien
				group by PHONG
				order by count(manv) DESC)

-- bai 6
select DISTINCT honv, tennv, tennv, dchi
from NHANVIEN join PHONGBAN on nhanvien.PHONG=phongban.MAPHG
			join DEAN  on phongban.MAPHG=dean.PHONG
			join DDIEMPHG on phongban.MAPHG=ddiemphg.MAPHG
where dean.DDIEM_DA=N'TP HCM' and ddiemphg.DDIEM!='TP HCM'

-- bai 7
select DISTINCT honv, tennv, tennv, dchi
from NHANVIEN join PHONGBAN on nhanvien.PHONG=phongban.MAPHG
			join DEAN  on phongban.MAPHG=dean.PHONG
			join DDIEMPHG on phongban.MAPHG=ddiemphg.MAPHG
where dean.DDIEM_DA!=ddiemphg.DDIEM
