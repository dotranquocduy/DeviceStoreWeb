﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BHDT.Models
{
    public class itemGioHang
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get; set; }
        public  string HinhAnh { get; set; }
        public itemGioHang(int imasp)
        {
            using (BHDTEntities db=new BHDTEntities())
            {
                this.MaSP = imasp;
                SanPham sp = db.SanPhams.Single(n => n.MaSP == imasp);
                TenSP = sp.TenSP;
                HinhAnh = sp.HinhAnh;
                DonGia = sp.DonGia.Value;
                SoLuong = 1;
                ThanhTien = DonGia * SoLuong;
            }
        }
        public itemGioHang(int imasp,int sl)
        {
            using (BHDTEntities db = new BHDTEntities())
            {
                this.MaSP = imasp;
                SanPham sp = db.SanPhams.Single(n => n.MaSP == imasp);
                TenSP = sp.TenSP;
                HinhAnh = sp.HinhAnh;
                SoLuong = sl;
                DonGia = sp.DonGia.Value;
                ThanhTien = DonGia * SoLuong;
            }
        }
        public itemGioHang() { }
    }
}