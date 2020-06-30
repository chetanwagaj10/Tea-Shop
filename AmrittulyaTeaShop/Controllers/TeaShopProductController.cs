using AmrittulyaTeaShop.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Mvc;

namespace AmrittulyaTeaShop.Controllers
{
    public class TeaShopProductController : Controller
    {
        public ActionResult TeaShopView()
        {
            return View();
        }
        // GET: TeaShopProduct
        public ActionResult Index()
        {
            using (TeaShopEntities teaShopEntities = new TeaShopEntities())
            {
                List<TeaShop> teaShops = teaShopEntities.TeaShops.ToList();
                if (teaShops.Count == 0)
                {
                    teaShops.Add(new TeaShop());
                }

                return View(teaShops);
            }
        }

        public async System.Threading.Tasks.Task<ActionResult> Details(int id)
        {
            TeaShop teaShops = new TeaShop();

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("http://localhost:58889/");

                client.DefaultRequestHeaders.Clear();

                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage Res = await client.GetAsync($"api/TeaShop/GetComponent/{id}");

                if (Res.IsSuccessStatusCode)
                {
                    var EmpResponse = Res.Content.ReadAsStringAsync().Result;

                    teaShops = JsonConvert.DeserializeObject<TeaShop>(EmpResponse);

                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Server error try after some time.");
                }

                return View(teaShops);
            }
        }
    }
}