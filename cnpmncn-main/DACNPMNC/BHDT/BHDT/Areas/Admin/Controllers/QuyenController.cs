using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BHDT.Models;
namespace BHDT.Areas.Admin.Controllers
{
    [Authorize(Roles = "QuanTri")]
    //[Authorize(Roles = "QLQuyen")]
    public class QuyenController : Controller
    {
        BHDTEntities db = new BHDTEntities();
        // GET: Admin/Quyen
        public ActionResult Index()
        {
            return View(db.Quyens.OrderBy(n=>n.MaQuyen));
        }
        [HttpGet]
        public ActionResult ThemQuyen()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemQuyen(Quyen quyen)
        {
            if (ModelState.IsValid)
            {
                db.Quyens.Add(quyen);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (db != null)
                    db.Dispose();
             
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}