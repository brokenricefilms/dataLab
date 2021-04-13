-- Linux: Ubuntu 20.10
-- SQL Server on Linux
-- SQL GUI: DBever Version 21.0.2.202104042040
-- Latest updates at: https://github.com/thuanpham2311/dataLab/blob/master/THCSDL/QuanLyGiaoVu/PhamTanThuan_bai2_lab3_CSDL_QuanLyGiaoVu.sql

use QuanLyGiaoVu
go

-- bài tập 1
SELECT masv, hosv + ' ' + tensv as hoTenSinhVien
FROM SINHVIEN

-- bài tập 2
SELECT tenmh
FROM MONHOC
where sotinchi>3

-- bài tập 3
SELECT *
FROM MONHOC
WHERE sotietTH IS NULL

-- bài tập 4
-- giá trị data import có 5-6 chữ số không có 6 chữ số
-- nên giá trị between ở đây giảm một số 0 so với yêu cầu đề bài
-- để có kết quả trả về
SELECT *
FROM SINHVIEN
WHERE hocbong BETWEEN 100000 AND 120000

-- bài tập 5
SELECT *
FROM MONHOC
WHERE tenmh    is NOT NULL AND
      sotietLT is NOT NULL AND
      sotietTH is NOT NULL AND
      makhoa   is NOT NULL

-- bài tập 6
SELECT *
FROM SINHVIEN
WHERE matinhtp='02' OR
      nu=1 AND makhoa='CNTT'

-- bài tập 7
-- define thứ tự giảm giần là học bổng
SELECT *
FROM SINHVIEN
WHERE hocbong is NOT NULL
ORDER BY hocbong DESC

-- bài tập 8
SELECT *
FROM SINHVIEN
WHERE makhoa='CNTT' OR
      makhoa='VL'   OR
      makhoa='QTKD' OR
      makhoa='XD'


-- bài tập 9
SELECT masv,
       hosv + ' ' + tensv               as hoTenSinhVien,
	   YEAR(GETDATE()) - YEAR(ngaysinh) as tuoi
FROM SINHVIEN
ORDER BY tuoi ASC

-- bài tập 10
SELECT *
FROM SINHVIEN
WHERE YEAR(ngaysinh)=1996 AND (
      MONTH(ngaysinh)=10  OR
	  MONTH(ngaysinh)=11  OR
	  MONTH(ngaysinh)=12)
