CREATE DATABASE QLBanSach;

USE QLBanSach;

CREATE TABLE khach_hang (
	ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    tai_khoan VARCHAR(50),
    mat_khau VARCHAR(50),
    email VARCHAR(150),
	dia_chi VARCHAR(150),
    gioi_tinh BOOLEAN,
    ngay_sinh DATE,
    ho_ten VARCHAR(100)
);

CREATE TABLE don_hang (
	ma_don_hang INT PRIMARY KEY AUTO_INCREMENT,
    da_thanh_toan BOOLEAN,
    ngay_giao DATETIME,
    ngay_dat DATETIME,
    tinh_trang_giao_hang BOOLEAN,
    
    ma_khach_hang INT,
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang)
);

CREATE TABLE chu_de (
	ma_chu_de INT PRIMARY KEY AUTO_INCREMENT,
    ten_chu_de VARCHAR(100)
);

CREATE TABLE nha_xuat_ban(
	ma_nha_san_xuat INT PRIMARY KEY AUTO_INCREMENT,
    ten_nha_xuat_ban VARCHAR(100),
    dien_thoai VARCHAR(15),
    dia_chi VARCHAR(100)
);

CREATE TABLE tac_gia(
	ma_tac_gia INT PRIMARY KEY AUTO_INCREMENT,
    ten_tac_gia VARCHAR(50),
    dia_chi VARCHAR(100),
    tieu_su VARCHAR(250),
    dien_thoai VARCHAR(15)
);

CREATE TABLE sach (
	ma_sach INT PRIMARY KEY AUTO_INCREMENT,
    ten_sach VARCHAR(100),
    gia_ban INT,
    mo_ta VARCHAR(250),
    anh_bia VARCHAR(250),
    ngay_cap_nhat DATE,
    so_luong_ton INT,
    
    ma_chu_de INT,
    ma_nha_san_xuat INT,
    FOREIGN KEY (ma_chu_de) REFERENCES chu_de(ma_chu_de),
    FOREIGN KEY (ma_nha_san_xuat) REFERENCES nha_xuat_ban(ma_nha_san_xuat)
);

CREATE TABLE hoa_don(
	ma_don_hang INT,
    ma_sach INT,
    so_luong INT,
    don_gia INT,
    PRIMARY KEY(ma_don_hang, ma_sach),
    FOREIGN KEY (ma_don_hang) REFERENCES don_hang(ma_don_hang),
    FOREIGN KEY (ma_sach) REFERENCES sach(ma_sach)
);

CREATE TABLE tac_pham(
	ma_tac_gia INT,
    ma_sach INT,
    vai_tro VARCHAR(250),
    vi_tri INT,
    PRIMARY KEY (ma_tac_gia, ma_sach),
    FOREIGN KEY (ma_tac_gia) REFERENCES tac_gia(ma_tac_gia),
    FOREIGN KEY (ma_sach) REFERENCES sach(ma_sach)
);

